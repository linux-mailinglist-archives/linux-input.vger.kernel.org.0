Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A628F339C5C
	for <lists+linux-input@lfdr.de>; Sat, 13 Mar 2021 07:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbhCMGdY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Mar 2021 01:33:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbhCMGdY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Mar 2021 01:33:24 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF6A2C061574
        for <linux-input@vger.kernel.org>; Fri, 12 Mar 2021 22:33:23 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id y131so26333120oia.8
        for <linux-input@vger.kernel.org>; Fri, 12 Mar 2021 22:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=+yC6AFuywpTMm8iUVjN9spO6ZpWBiMCbvpxDhNtKTgs=;
        b=plsxxVh50nK9TnuR1cdnUoZ/90bJd/gEoNvzWjHtMlO/27Z7/IGSrTWEY6NQ71UHCH
         OgeIiaRkzKMmq0bKgOy7ZKc04emrwBFwD2VybvFKO2ZssqWxL4JvDtg3dtXiEj7rA78N
         bMCxkq1l7CQt3Q0He8uuPfs8iI+NwjXMtZ/Cm1JJofMWhkFWsmdeld4U7QMMw4cI6RjC
         OSVzBQ0o3LP6EBDdpiZK9sxD/RC/2J0XA6VeIHpbG1rjEF9s3P7vlhEv9cln7bIUGQVA
         aZgmj6T4yyKg5ZGb3vp75hGE2Yr5rIunLPs/Z6HAQB75jcHy/+pTE59XT6OCfFP7XXth
         vSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=+yC6AFuywpTMm8iUVjN9spO6ZpWBiMCbvpxDhNtKTgs=;
        b=D1TBeMkkmSGl0IE+dL6PPsZAOLAqEYz/AX22CRQhW/Ri02gZ4zcvWkZthSeABMZYhh
         2uOM/c3dH7lJ2F4G2dVgECCEx64lULuVPAv1w0T9ecI68Y4fxbHT/GvgoM30Ci0Rqp1i
         z+somE/h65PUqIWtJoYCuFBaUPYSsP26Ki+pWJRrhfVKtfgyiV24hG+gN7IsNLYIWTEn
         nphyENTWnGEyUaLxoR5aHJaXqKkyaYI6geg3u6OmK3JpiDO/lFPRHoyo1GZoXVWGzEc3
         //OqIpI0Hbb6g6bOQ3BePymFNdnFIkV3G9uBfSVKAiQaqkbZcD5XoAr8vcQ8miXzTfrH
         r88A==
X-Gm-Message-State: AOAM531I3k6WN9x0KStSjghS2m09Jr4B4V01YRCXqAf7on+6m2/YAGkN
        qB+PQYBrqZQNbRT0KkrKtED/3jlIR0vA0GbfKfo=
X-Google-Smtp-Source: ABdhPJycHdp7lWs69uLR1en145JgPMYczONreFtkyfOmPa6ASGs07bSM410xk/Ss/GzUKhpJU9+QPox0AHz/AZuuS0w=
X-Received: by 2002:a54:4806:: with SMTP id j6mr12760295oij.15.1615617203018;
 Fri, 12 Mar 2021 22:33:23 -0800 (PST)
MIME-Version: 1.0
From:   Zhai Zhaoxuan <kxuanobj@gmail.com>
Date:   Sat, 13 Mar 2021 14:32:46 +0800
Message-ID: <CAAnY7J2yYdsLMG=07u6QPf5SKN6ba=D+v=SE1vSMxWgP4A05pQ@mail.gmail.com>
Subject: [BUG]an input device can not support more than 568 keys due to uevent
 buffer too small
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-input@vger.kernel.org, Markus Rechberger <kontakt@sundtek.de>
Content-Type: multipart/mixed; boundary="0000000000007ac10205bd65310a"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--0000000000007ac10205bd65310a
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry and Greg,

I recently started making a keyboard utility. It basically helps the
user press some keys based on a user script.
So I tried to use the "uinput" driver to help me send keys to the kernel.

Due to any key and combination can be requested by the user script, I
tried to enable all KEYBIT on the uinput device. But it fails.
And more accurate, using a binary search, it seems that I am unable to
enable more than 568 keys.
The KEY_MAX (defined in linux/input-event-codes.h) is 0x2ff. So it
should be ok to enable 767 keys. The uinput device should not fail
with only 568 keys.

I read system logs. The log shows that the new input device fails due
to systemd-udevd trying to read
`/sys/devices/virtual/input/input4/uevent`, but this file is empty
unexpectedly.

Then ,I searched on the web about this and found a bug opened in
2016-05-24 by Markus:
https://bugzilla.kernel.org/show_bug.cgi?id=118861
The status of this bug is still NEW.

I tried to debug the kernel. And I got something that may be useful.
The "uevent" shows empty, because a -ENOMEM error returns by
`input_add_uevent_modalias_var`.
And this function returns -ENOMEM, because the `buf` on `struct
kobj_uevent_env` is not enough.

The size of `buf` is 2048 (UEVENT_BUFFER_SIZE). According to the
MODALIAS encoding algorithm (input_print_modalias_bits), if we allow
all 0x2ff keys to be enabled on the
uinput device, the buffer should have at least 2477 bytes. (2477 =  3
* (0xff - 0x71 + 1) + 4 * 0x200)
2048 is smaller than 2477, so it fails.

I have tried to set UEVENT_BUFFER_SIZE to 4096. After that,
everythings seems ok. The `/sys/devices/virtual/input/input4/uevent`
can show its content correctly. (See the attachment uevent.txt)

Since this change is related to the core feature kobject which is used
everywhere in the kernel, I don't know if doubling the
UEVENT_BUFFER_SIZE is the best way to fix it, or if it will cause
other serious problems.
Or maybe we can use a dynamic buffer size in `struct kobj_uevent_env`.


Thank you,
Zhai Zhaoxuan

--0000000000007ac10205bd65310a
Content-Type: text/plain; charset="US-ASCII"; name="uevent.txt"
Content-Disposition: attachment; filename="uevent.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_km7cinxv0>
X-Attachment-Id: f_km7cinxv0

UFJPRFVDVD0zLzEyMzQvNTY3OC8wCk5BTUU9IkV4YW1wbGUgZGV2aWNlIgpQUk9QPTAKRVY9MwpL
RVk9N2ZmZmZmZmZmZmZmZmZmZiBmZmZmZmZmZmZmZmZmZmZmIGZmZmZmZmZmZmZmZmZmZmYgZmZm
ZmZmZmZmZmZmZmZmZiBmZmZmZmZmZmZmZmZmZmZmIGZmZmZmZmZmZmZmZmZmZmYgZmZmZmZmZmZm
ZmZmZmZmZiBmZmZmZmZmZmZmZmZmZmZmIGZmZmZmZmZmZmZmZmZmZmYgZmZmZmZmZmZmZmZmZmZm
ZiBmZmZmZmZmZmZmZmZmZmZmIGZmZmZmZmZmZmZmZmZmZmUKTU9EQUxJQVM9aW5wdXQ6YjAwMDN2
MTIzNHA1Njc4ZTAwMDAtZTAsMSxrNzEsNzIsNzMsNzQsNzUsNzYsNzcsNzgsNzksN0EsN0IsN0Ms
N0QsN0UsN0YsODAsODEsODIsODMsODQsODUsODYsODcsODgsODksOEEsOEIsOEMsOEQsOEUsOEYs
OTAsOTEsOTIsOTMsOTQsOTUsOTYsOTcsOTgsOTksOUEsOUIsOUMsOUQsOUUsOUYsQTAsQTEsQTIs
QTMsQTQsQTUsQTYsQTcsQTgsQTksQUEsQUIsQUMsQUQsQUUsQUYsQjAsQjEsQjIsQjMsQjQsQjUs
QjYsQjcsQjgsQjksQkEsQkIsQkMsQkQsQkUsQkYsQzAsQzEsQzIsQzMsQzQsQzUsQzYsQzcsQzgs
QzksQ0EsQ0IsQ0MsQ0QsQ0UsQ0YsRDAsRDEsRDIsRDMsRDQsRDUsRDYsRDcsRDgsRDksREEsREIs
REMsREQsREUsREYsRTAsRTEsRTIsRTMsRTQsRTUsRTYsRTcsRTgsRTksRUEsRUIsRUMsRUQsRUUs
RUYsRjAsRjEsRjIsRjMsRjQsRjUsRjYsRjcsRjgsRjksRkEsRkIsRkMsRkQsRkUsRkYsMTAwLDEw
MSwxMDIsMTAzLDEwNCwxMDUsMTA2LDEwNywxMDgsMTA5LDEwQSwxMEIsMTBDLDEwRCwxMEUsMTBG
LDExMCwxMTEsMTEyLDExMywxMTQsMTE1LDExNiwxMTcsMTE4LDExOSwxMUEsMTFCLDExQywxMUQs
MTFFLDExRiwxMjAsMTIxLDEyMiwxMjMsMTI0LDEyNSwxMjYsMTI3LDEyOCwxMjksMTJBLDEyQiwx
MkMsMTJELDEyRSwxMkYsMTMwLDEzMSwxMzIsMTMzLDEzNCwxMzUsMTM2LDEzNywxMzgsMTM5LDEz
QSwxM0IsMTNDLDEzRCwxM0UsMTNGLDE0MCwxNDEsMTQyLDE0MywxNDQsMTQ1LDE0NiwxNDcsMTQ4
LDE0OSwxNEEsMTRCLDE0QywxNEQsMTRFLDE0RiwxNTAsMTUxLDE1MiwxNTMsMTU0LDE1NSwxNTYs
MTU3LDE1OCwxNTksMTVBLDE1QiwxNUMsMTVELDE1RSwxNUYsMTYwLDE2MSwxNjIsMTYzLDE2NCwx
NjUsMTY2LDE2NywxNjgsMTY5LDE2QSwxNkIsMTZDLDE2RCwxNkUsMTZGLDE3MCwxNzEsMTcyLDE3
MywxNzQsMTc1LDE3NiwxNzcsMTc4LDE3OSwxN0EsMTdCLDE3QywxN0QsMTdFLDE3RiwxODAsMTgx
LDE4MiwxODMsMTg0LDE4NSwxODYsMTg3LDE4OCwxODksMThBLDE4QiwxOEMsMThELDE4RSwxOEYs
MTkwLDE5MSwxOTIsMTkzLDE5NCwxOTUsMTk2LDE5NywxOTgsMTk5LDE5QSwxOUIsMTlDLDE5RCwx
OUUsMTlGLDFBMCwxQTEsMUEyLDFBMywxQTQsMUE1LDFBNiwxQTcsMUE4LDFBOSwxQUEsMUFCLDFB
QywxQUQsMUFFLDFBRiwxQjAsMUIxLDFCMiwxQjMsMUI0LDFCNSwxQjYsMUI3LDFCOCwxQjksMUJB
LDFCQiwxQkMsMUJELDFCRSwxQkYsMUMwLDFDMSwxQzIsMUMzLDFDNCwxQzUsMUM2LDFDNywxQzgs
MUM5LDFDQSwxQ0IsMUNDLDFDRCwxQ0UsMUNGLDFEMCwxRDEsMUQyLDFEMywxRDQsMUQ1LDFENiwx
RDcsMUQ4LDFEOSwxREEsMURCLDFEQywxREQsMURFLDFERiwxRTAsMUUxLDFFMiwxRTMsMUU0LDFF
NSwxRTYsMUU3LDFFOCwxRTksMUVBLDFFQiwxRUMsMUVELDFFRSwxRUYsMUYwLDFGMSwxRjIsMUYz
LDFGNCwxRjUsMUY2LDFGNywxRjgsMUY5LDFGQSwxRkIsMUZDLDFGRCwxRkUsMUZGLDIwMCwyMDEs
MjAyLDIwMywyMDQsMjA1LDIwNiwyMDcsMjA4LDIwOSwyMEEsMjBCLDIwQywyMEQsMjBFLDIwRiwy
MTAsMjExLDIxMiwyMTMsMjE0LDIxNSwyMTYsMjE3LDIxOCwyMTksMjFBLDIxQiwyMUMsMjFELDIx
RSwyMUYsMjIwLDIyMSwyMjIsMjIzLDIyNCwyMjUsMjI2LDIyNywyMjgsMjI5LDIyQSwyMkIsMjJD
LDIyRCwyMkUsMjJGLDIzMCwyMzEsMjMyLDIzMywyMzQsMjM1LDIzNiwyMzcsMjM4LDIzOSwyM0Es
MjNCLDIzQywyM0QsMjNFLDIzRiwyNDAsMjQxLDI0MiwyNDMsMjQ0LDI0NSwyNDYsMjQ3LDI0OCwy
NDksMjRBLDI0QiwyNEMsMjRELDI0RSwyNEYsMjUwLDI1MSwyNTIsMjUzLDI1NCwyNTUsMjU2LDI1
NywyNTgsMjU5LDI1QSwyNUIsMjVDLDI1RCwyNUUsMjVGLDI2MCwyNjEsMjYyLDI2MywyNjQsMjY1
LDI2NiwyNjcsMjY4LDI2OSwyNkEsMjZCLDI2QywyNkQsMjZFLDI2RiwyNzAsMjcxLDI3MiwyNzMs
Mjc0LDI3NSwyNzYsMjc3LDI3OCwyNzksMjdBLDI3QiwyN0MsMjdELDI3RSwyN0YsMjgwLDI4MSwy
ODIsMjgzLDI4NCwyODUsMjg2LDI4NywyODgsMjg5LDI4QSwyOEIsMjhDLDI4RCwyOEUsMjhGLDI5
MCwyOTEsMjkyLDI5MywyOTQsMjk1LDI5NiwyOTcsMjk4LDI5OSwyOUEsMjlCLDI5QywyOUQsMjlF
LDI5RiwyQTAsMkExLDJBMiwyQTMsMkE0LDJBNSwyQTYsMkE3LDJBOCwyQTksMkFBLDJBQiwyQUMs
MkFELDJBRSwyQUYsMkIwLDJCMSwyQjIsMkIzLDJCNCwyQjUsMkI2LDJCNywyQjgsMkI5LDJCQSwy
QkIsMkJDLDJCRCwyQkUsMkJGLDJDMCwyQzEsMkMyLDJDMywyQzQsMkM1LDJDNiwyQzcsMkM4LDJD
OSwyQ0EsMkNCLDJDQywyQ0QsMkNFLDJDRiwyRDAsMkQxLDJEMiwyRDMsMkQ0LDJENSwyRDYsMkQ3
LDJEOCwyRDksMkRBLDJEQiwyREMsMkRELDJERSwyREYsMkUwLDJFMSwyRTIsMkUzLDJFNCwyRTUs
MkU2LDJFNywyRTgsMkU5LDJFQSwyRUIsMkVDLDJFRCwyRUUsMkVGLDJGMCwyRjEsMkYyLDJGMywy
RjQsMkY1LDJGNiwyRjcsMkY4LDJGOSwyRkEsMkZCLDJGQywyRkQsMkZFLHJhbWxzZncKCg==
--0000000000007ac10205bd65310a--
