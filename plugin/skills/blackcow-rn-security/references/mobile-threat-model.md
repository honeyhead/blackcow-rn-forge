# Mobile Threat Model

## Critical

- service role or private API key in bundle
- access token stored in insecure plain storage
- unrestricted WebView bridge executing privileged actions

## High

- universal link / deep link payload not validated
- debug menu or test endpoint active in release path
- sensitive values in logs or analytics properties

## Medium

- no screenshot protection where financial or health data is visible
- weak certificate or transport assumptions
- insecure local cache of user data

## Questions to answer

- Can a stolen device expose session data?
- Can a crafted deep link trigger privileged navigation?
- Can WebView content call privileged native code?
- Can logs leak tokens or PII?
