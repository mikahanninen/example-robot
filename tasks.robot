*** Settings ***
Library           RPA.FileSystem
Library           RPA.FTP
Library           RPA.Robocorp.Vault
Library           RPA.Robocorp.WorkItems
Library           RPA.Email.ImapSmtp
Library           CustomPDFLibrary
Variables         variables.py
# The robot in uipath, downloaded the files from the mail.
# Convert the pdf into text, eliminating line breaks and spaces.
# Later with Regex, it located identification numbers and finally it uploaded it to an ftp.

*** Keywords ***
Task initialization steps
    ${secret}=    Get Secret    email
    Authorize IMAP
    ...    account=${secret}[username]
    ...    password=${secret}[password]
    ...    imap_server=imap.gmail.com

Read company address from PDF
    [Arguments]    ${pdf_filepath}
    Open Document    ${pdf_filepath}
    ${text}    ${onpage}=    Get Pdf Text    ${COMPANY_ADDRESS_PATTERNS}
    Log To Console    Found Text on page ${onpage}: ${text}
    Close Document
    [Return]    ${text}

Get PDFs from Emails
    ${secret}=    Get Secret    email
    ${messages}=    List Messages    (HEADER FROM "${secret}[sender]")
    FOR    ${msg}    IN    @{messages}
        IF    ${msg}[Has-Attachments]
            Save Attachment    ${msg}    %{ROBOT_ROOT}${/}output    overwrite=True
        END
    END
    ${pdfs}=    Find Files    %{ROBOT_ROOT}${/}output${/}*.pdf
    [Return]    ${pdfs}

*** Tasks ***
Minimal task
    [Setup]    Task initialization steps
    ${list_of_pdfs}=    Get PDFs from Emails
    FOR    ${pdf}    IN    @{list_of_pdfs}
        Log To Console    \nChecking file: ${pdf}
        ${text}    Read company address from PDF    ${pdf}
    END
    Log    Done.
