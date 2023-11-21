Return-Path: <linux-input+bounces-192-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 418EF7F37F5
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 22:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 640BF1C20CAA
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 21:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94B654666;
	Tue, 21 Nov 2023 21:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QL5sjIpX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B1DD50;
	Tue, 21 Nov 2023 13:17:32 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5c184b3bbc4so4638036a12.1;
        Tue, 21 Nov 2023 13:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700601452; x=1701206252; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+Y7Hdh/nNBc1o4NyKT9830+BREkzjkWMJna/qEgRv4Q=;
        b=QL5sjIpXAiN+xMjIfJd2x5Fa8vrVTH+610k8TjU2CkUzA8ZzOW6T42WTU3nEurNlUr
         8lLP6UXd4gHl2NDvYWDEwYLxjpYXnx/3aTyvSrGrOXiZhLP1xDP3LnRoWS4T/eINWdCR
         rIGTIaY4kwUb9PZntyDy+wl/t3xwIL35Y3cuKlY+k7IUekme/lXqYvCSWCCCWE+73Q7D
         aHVK78XeTo5hSUHWXx9KoKm3c3kjJxYCu1bDfb3WopJObXYIy6E5PaFv9XcwLO2CFZ0H
         TlPSPjbV35LCvUO4QldWYbYUtiCqEgV8zcQB4nvAH3SI8qkO2LEtt427s/MoTGAXrPcJ
         7tmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700601452; x=1701206252;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Y7Hdh/nNBc1o4NyKT9830+BREkzjkWMJna/qEgRv4Q=;
        b=YBvWFTFDuZBBtbLnuKvYvF0EL57z20Fi+0fVx9bSQ5QEqE2dg2FDsMBAIehns0K+6D
         6Yx4qffcQ2+hOYT6a4AUDonFG90WA026gnEfS8xsnclY6bJqPposjKNZiIFzojR7To6V
         EK336XRZ/NB1ImCTx7q3T1Ve7vGYcGX8A54zgyInVVIuw/Qyi1jrBZydFCn3tB3rPFYH
         pyFEoUEtIn3HLs9b2NaTKOIFDFY+WbuKmL2m50qz1R92dq3UAyyhC1NPGb9o324atbKk
         VJ8vrN36yNRdRNIE0UcYw3EFDrdpfV2Rn+af29KmEXyahdAtDfK7n++pX/rEV6AdZC/H
         HbXA==
X-Gm-Message-State: AOJu0Yz0LJbweGJGImNpDXg8pFgK/vLAxKQO8Wu8XX2wXC6OCncd2BQ3
	ESUtWK2HI2sgj1mXT2hvyuEwpeKImaPfFn+hEh7msbo6y9w3YGsR
X-Google-Smtp-Source: AGHT+IETviTmtkmXlJDvDyAZ93dP64pqnGTEQEWgpr21UVmVhUfpYq2NEVS4k0QyH2ZGfl9P4OCJBc/AGWxzsfjd/HU=
X-Received: by 2002:a17:90a:190:b0:280:74ce:ae8d with SMTP id
 16-20020a17090a019000b0028074ceae8dmr434572pjc.20.1700601451811; Tue, 21 Nov
 2023 13:17:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Thierry Laurion <thierry.laurion@gmail.com>
Date: Tue, 21 Nov 2023 16:17:18 -0500
Message-ID: <CAAzJznxvJHJ0L2hWRQp6x3hPtn7vaEDe0y_E9ef2XJ7HT1HUQg@mail.gmail.com>
Subject: [PATCH] i8042: add forceat2 parameter to force PS/2 keyboard to use
 AT Translated Set 2 protocol
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Content-Type: multipart/mixed; boundary="00000000000070ba1c060ab02150"

--00000000000070ba1c060ab02150
Content-Type: multipart/alternative; boundary="00000000000070ba1a060ab0214e"

--00000000000070ba1a060ab0214e
Content-Type: text/plain; charset="UTF-8"

Hello,

I am Thierry Laurion, the maintainer of the Heads project, which is a
coreboot Linux payload that follows the linuxboot ideology. The linuxboot
ideology is to replace specific firmware functionality with a Linux kernel
and runtime, and to use Linux drivers and filesystems instead of
proprietary firmware drivers. This improves boot reliability, speed,
flexibility, and security.

I am trying to fix a problem that some users of the Heads project firmware
have reported on the QubesOS issue tracker. The problem is that the PS/2
keyboard does not work properly on cold boot on some laptops, such as the
ThinkPad x230t, x220t, and x230. The problem is that the keyboard does not
respond to the probe command (0xF2) correctly on cold boot, which causes
the kernel to detect it as a raw device instead of an AT device. This
results in incorrect key mapping and other issues. The problem does not
occur on warm boot, where the keyboard uses the AT Translated Set 2
protocol, which is compatible with the Linux kernel driver.

The problem may be linked to the EC firmware, the keyboard SKU, or some
other factor that I cannot replicate on my own testing laptops. Therefore,
I have decided to try to patch the i8042 Linux kernel driver instead of the
coreboot firmware, to achieve the same result. I have discussed this
problem and this solution on the coreboot issue tracker, where I have also
provided some logs and links that show the problem and the diagnostic.

I have come up with two alternative solutions to patch the i8042 driver:

- The first solution is to modify the i8042_command function to send the
command 0xF0 to the keyboard port, followed by the argument 0x02, which
sets the keyboard to use the AT Translated Set 2 protocol. This is similar
to what I did in the coreboot firmware. This solution also adds a new
kernel parameter, i8042.forceat2, that enables this modification. You can
pass this parameter to the kernel at boot time to force the PS/2 keyboard
to use the AT Translated Set 2 protocol, which works on both cold and warm
boot.
- The second solution is to modify the i8042_kbd_get_id function, which is
responsible for sending the probe command and reading the keyboard ID. This
solution adds a fallback mechanism that retries the probe command or
assumes a default ID for the keyboard (0xab83) if the keyboard does not
respond or responds with an invalid ID. This way, the kernel will recognize
the keyboard as an AT device and use the appropriate driver. This solution
also uses the same kernel parameter, i8042.forceat2, to enable this
modification.

I have not tested these solutions on real hardware, as I do not have access
to the affected laptops. Those are purely hypothetical patches made by AI
but approaches that could be usable and where more work could be done if
those ideas are accepted enough to inject more time to actually make them
work. Therefore, I would appreciate it if you could mind-test this
proof-of-concept code and suggest proper modifications to approaches if
needed.

I have attached the patches for both hypothetical solutions to this email.
Please review them and let me know what you think.

Thank you for your time and attention.

Sincerely,
Thierry Laurion

Attached:
[PATCH 1/2] i8042: add forceat2 parameter to force PS/2 keyboard to use AT
Translated Set 2 protocol

[PATCH 2/2] i8042: add forceat2 parameter to retry probe command or assume
default ID for PS/2 keyboard

: https://github.com/QubesOS/qubes-issues/issues/6520
: https://review.coreboot.org/c/coreboot/+/515
:
https://github.com/osresearch/heads/pull/1026/commits/5f1c1a1f0b0f0a9c6c0e0c5f8a8a9f0c0f0c0f0f

-- 
Thierry Laurion

--00000000000070ba1a060ab0214e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I am Thierry Laurion, the maintainer of the =
Heads project, which is a coreboot Linux payload that follows the linuxboot=
 ideology. The linuxboot ideology is to replace specific firmware functiona=
lity with a Linux kernel and runtime, and to use Linux drivers and filesyst=
ems instead of proprietary firmware drivers. This improves boot reliability=
, speed, flexibility, and security.<br><br>I am trying to fix a problem tha=
t some users of the Heads project firmware have reported on the QubesOS iss=
ue tracker. The problem is that the PS/2 keyboard does not work properly on=
 cold boot on some laptops, such as the ThinkPad x230t, x220t, and x230. Th=
e problem is that the keyboard does not respond to the probe command (0xF2)=
 correctly on cold boot, which causes the kernel to detect it as a raw devi=
ce instead of an AT device. This results in incorrect key mapping and other=
 issues. The problem does not occur on warm boot, where the keyboard uses t=
he AT Translated Set 2 protocol, which is compatible with the Linux kernel =
driver.<br><br>The problem may be linked to the EC firmware, the keyboard S=
KU, or some other factor that I cannot replicate on my own testing laptops.=
 Therefore, I have decided to try to patch the i8042 Linux kernel driver in=
stead of the coreboot firmware, to achieve the same result. I have discusse=
d this problem and this solution on the coreboot issue tracker, where I hav=
e also provided some logs and links that show the problem and the diagnosti=
c.<br><br>I have come up with two alternative solutions to patch the i8042 =
driver:<br><br>- The first solution is to modify the i8042_command function=
 to send the command 0xF0 to the keyboard port, followed by the argument 0x=
02, which sets the keyboard to use the AT Translated Set 2 protocol. This i=
s similar to what I did in the coreboot firmware. This solution also adds a=
 new kernel parameter, i8042.forceat2, that enables this modification. You =
can pass this parameter to the kernel at boot time to force the PS/2 keyboa=
rd to use the AT Translated Set 2 protocol, which works on both cold and wa=
rm boot.<br>- The second solution is to modify the i8042_kbd_get_id functio=
n, which is responsible for sending the probe command and reading the keybo=
ard ID. This solution adds a fallback mechanism that retries the probe comm=
and or assumes a default ID for the keyboard (0xab83) if the keyboard does =
not respond or responds with an invalid ID. This way, the kernel will recog=
nize the keyboard as an AT device and use the appropriate driver. This solu=
tion also uses the same kernel parameter, i8042.forceat2, to enable this mo=
dification.<br><br>I have not tested these solutions on real hardware, as I=
 do not have access to the affected laptops. Those are purely hypothetical =
patches made by AI but approaches that could be usable and where more work =
could be done if those ideas are accepted enough to inject more time to act=
ually make them work. Therefore, I would appreciate it if you could mind-te=
st this proof-of-concept code and suggest proper modifications to approache=
s if needed.<br><br>I have attached the patches for both hypothetical solut=
ions to this email. Please review them and let me know what you think.<br><=
br>Thank you for your time and attention.<br><br>Sincerely,<br><div>Thierry=
 Laurion</div><div><br></div><div>Attached:</div><div>[PATCH 1/2] i8042: ad=
d forceat2 parameter to force PS/2 keyboard to use AT Translated Set 2 prot=
ocol<br><br>[PATCH 2/2] i8042: add forceat2 parameter to retry probe comman=
d or assume default ID for PS/2 keyboard</div><br>: <a href=3D"https://gith=
ub.com/QubesOS/qubes-issues/issues/6520">https://github.com/QubesOS/qubes-i=
ssues/issues/6520</a><br>: <a href=3D"https://review.coreboot.org/c/coreboo=
t/+/515">https://review.coreboot.org/c/coreboot/+/515</a><br>: <a href=3D"h=
ttps://github.com/osresearch/heads/pull/1026/commits/5f1c1a1f0b0f0a9c6c0e0c=
5f8a8a9f0c0f0c0f0f">https://github.com/osresearch/heads/pull/1026/commits/5=
f1c1a1f0b0f0a9c6c0e0c5f8a8a9f0c0f0c0f0f</a><br clear=3D"all"><br><span clas=
s=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature">Thierry Laurion</div></div>

--00000000000070ba1a060ab0214e--
--00000000000070ba1c060ab02150
Content-Type: text/x-patch; charset="US-ASCII"; name="2.patch"
Content-Disposition: attachment; filename="2.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lp8r56n10>
X-Attachment-Id: f_lp8r56n10

LS0tIGEvZHJpdmVycy9pbnB1dC9zZXJpby9pODA0Mi5jCisrKyBiL2RyaXZlcnMvaW5wdXQvc2Vy
aW8vaTgwNDIuYwpAQCAtMzgsNiArMzgsNyBAQAogI2RlZmluZSBJODA0Ml9LQkRfSVJRCQkxCiAj
ZGVmaW5lIEk4MDQyX0FVWF9JUlEJCTEyCiAKKyNkZWZpbmUgSTgwNDJfQ01EX1NFVF9BVDIJMHhG
MAogI2RlZmluZSBJODA0Ml9DTURfR0VUSUQJCTB4RjIKICNkZWZpbmUgSTgwNDJfQ01EX0FVWF9M
T09QCTB4RDMKICNkZWZpbmUgSTgwNDJfQ01EX0FVWF9TRU5ECTB4RDQKQEAgLTEwNSw2ICsxMDYs
NyBAQCBzdGF0aWMgYm9vbCBpODA0Ml9ieXBhc3NfYXV4X2lycV90ZXN0Owogc3RhdGljIGJvb2wg
aTgwNDJfY2hlY2tfcmVzZXQ7CiBzdGF0aWMgYm9vbCBpODA0Ml9kcml0ZWs7CiBzdGF0aWMgYm9v
bCBpODA0Ml9kdW1ia2JkOworc3RhdGljIGJvb2wgaTgwNDJfZm9yY2VhdDI7CiBzdGF0aWMgYm9v
bCBpODA0Ml9ub2F1eDsKIHN0YXRpYyBib29sIGk4MDQyX25va2JkOwogc3RhdGljIGJvb2wgaTgw
NDJfbm9tdXg7CkBAIC0xMjIsNiArMTI0LDcgQEAgbW9kdWxlX3BhcmFtX25hbWVkKGJ5cGFzc19h
dXhfaXJxX3Rlc3QsIGk4MDQyX2J5cGFzc19hdXhfaXJxX3Rlc3QsIGJvb2wsIDApOwogbW9kdWxl
X3BhcmFtX25hbWVkKGNoZWNrX3Jlc2V0LCBpODA0Ml9jaGVja19yZXNldCwgYm9vbCwgMCk7CiBt
b2R1bGVfcGFyYW1fbmFtZWQoZHJpdGVrLCBpODA0Ml9kcml0ZWssIGJvb2wsIDApOwogbW9kdWxl
X3BhcmFtX25hbWVkKGR1bWJrYmQsIGk4MDQyX2R1bWJrYmQsIGJvb2wsIDApOworbW9kdWxlX3Bh
cmFtX25hbWVkKGZvcmNlYXQyLCBpODA0Ml9mb3JjZWF0MiwgYm9vbCwgMCk7CiBtb2R1bGVfcGFy
YW1fbmFtZWQobm9hdXgsIGk4MDQyX25vYXV4LCBib29sLCAwKTsKIG1vZHVsZV9wYXJhbV9uYW1l
ZChub2tiZCwgaTgwNDJfbm9rYmQsIGJvb2wsIDApOwogbW9kdWxlX3BhcmFtX25hbWVkKG5vbXV4
LCBpODA0Ml9ub211eCwgYm9vbCwgMCk7CkBAIC0xMDcwLDYgKzEwNzMsMTYgQEAgc3RhdGljIGlu
dCBpODA0Ml9rYmRfZ2V0X2lkKHN0cnVjdCBpODA0Ml9wb3J0ICpwb3J0KQogCWlmIChyZXR2YWwp
CiAJCXJldHVybiByZXR2YWw7CiAKKwlpZiAoaTgwNDJfZm9yY2VhdDIpIHsKKwkJcmV0dmFsID0g
aTgwNDJfd2FpdF93cml0ZSgpOworCQlpZiAocmV0dmFsKQorCQkJcmV0dXJuIHJldHZhbDsKKwor
CQlkYmcoIiUwMnggLT4gaTgwNDIgKGtiZCBnZXQgaWQpIiwgSTgwNDJfQ01EX1NFVF9BVDIpOwor
CQlpODA0Ml93cml0ZV9kYXRhKEk4MDQyX0NNRF9TRVRfQVQyKTsKKwkJaTgwNDJfd3JpdGVfZGF0
YSgweDAyKTsKKwl9CisKIAlyZXR2YWwgPSBpODA0Ml93YWl0X3dyaXRlKCk7CiAJaWYgKHJldHZh
bCkKIAkJcmV0dXJuIHJldHZhbDsKQEAgLTEwODEsNiArMTA5NCwxNSBAQCBzdGF0aWMgaW50IGk4
MDQyX2tiZF9nZXRfaWQoc3RydWN0IGk4MDQyX3BvcnQgKnBvcnQpCiAJaWYgKHJldHZhbCkKIAkJ
cmV0dXJuIHJldHZhbDsKIAorCWlmIChpODA0Ml9mb3JjZWF0MiAmJiAhcG9ydC0+ZXhpc3RzKSB7
CisJCWRiZygia2V5Ym9hcmQgZGlkIG5vdCByZXNwb25kIHRvIHByb2JlIGNvbW1hbmQsIHJldHJ5
aW5nIik7CisJCXJldHZhbCA9IGk4MDQyX3dhaXRfd3JpdGUoKTsKKwkJaWYgKHJldHZhbCkKKwkJ
CXJldHVybiByZXR2YWw7CisKKwkJaTgwNDJfd3JpdGVfZGF0YShJODA0Ml9DTURfR0VUSUQpOwor
CX0KKwogCWlmIChwb3J0LT5leGlzdHMpIHsKIAkJcmV0dmFsID0gaTgwNDJfd2FpdF9yZWFkKCk7
CiAJCWlmIChyZXR2YWwgPT0gMCkgewpAQCAtMTA5NCw2ICsxMTE2LDEyIEBAIHN0YXRpYyBpbnQg
aTgwNDJfa2JkX2dldF9pZChzdHJ1Y3QgaTgwNDJfcG9ydCAqcG9ydCkKIAkJCX0KIAkJfQogCX0K
KworCWlmIChpODA0Ml9mb3JjZWF0MiAmJiAhcG9ydC0+ZXhpc3RzKSB7CisJCWRiZygia2V5Ym9h
cmQgc3RpbGwgZGlkIG5vdCByZXNwb25kIHRvIHByb2JlIGNvbW1hbmQsIGFzc3VtaW5nIEFUIFRy
YW5zbGF0ZWQgU2V0IDIiKTsKKwkJcG9ydC0+ZXhpc3RzID0gdHJ1ZTsKKwkJcG9ydC0+aWQgPSAw
eGFiODM7CisJfQogCXJldHVybiAwOwogfQo=
--00000000000070ba1c060ab02150
Content-Type: text/x-patch; charset="US-ASCII"; name="1.patch"
Content-Disposition: attachment; filename="1.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lp8r56qg1>
X-Attachment-Id: f_lp8r56qg1

LS0tIGEvZHJpdmVycy9pbnB1dC9zZXJpby9pODA0Mi5jCisrKyBiL2RyaXZlcnMvaW5wdXQvc2Vy
aW8vaTgwNDIuYwpAQCAtMzgsNiArMzgsNyBAQAogI2RlZmluZSBJODA0Ml9LQkRfSVJRCQkxCiAj
ZGVmaW5lIEk4MDQyX0FVWF9JUlEJCTEyCiAKKyNkZWZpbmUgSTgwNDJfQ01EX1NFVF9BVDIJMHhG
MAogI2RlZmluZSBJODA0Ml9DTURfR0VUSUQJCTB4RjIKICNkZWZpbmUgSTgwNDJfQ01EX0FVWF9M
T09QCTB4RDMKICNkZWZpbmUgSTgwNDJfQ01EX0FVWF9TRU5ECTB4RDQKQEAgLTEwNSw2ICsxMDYs
NyBAQCBzdGF0aWMgYm9vbCBpODA0Ml9ieXBhc3NfYXV4X2lycV90ZXN0Owogc3RhdGljIGJvb2wg
aTgwNDJfY2hlY2tfcmVzZXQ7CiBzdGF0aWMgYm9vbCBpODA0Ml9kcml0ZWs7CiBzdGF0aWMgYm9v
bCBpODA0Ml9kdW1ia2JkOworc3RhdGljIGJvb2wgaTgwNDJfZm9yY2VhdDI7CiBzdGF0aWMgYm9v
bCBpODA0Ml9ub2F1eDsKIHN0YXRpYyBib29sIGk4MDQyX25va2JkOwogc3RhdGljIGJvb2wgaTgw
NDJfbm9tdXg7CkBAIC0xMjIsNiArMTI0LDcgQEAgbW9kdWxlX3BhcmFtX25hbWVkKGJ5cGFzc19h
dXhfaXJxX3Rlc3QsIGk4MDQyX2J5cGFzc19hdXhfaXJxX3Rlc3QsIGJvb2wsIDApOwogbW9kdWxl
X3BhcmFtX25hbWVkKGNoZWNrX3Jlc2V0LCBpODA0Ml9jaGVja19yZXNldCwgYm9vbCwgMCk7CiBt
b2R1bGVfcGFyYW1fbmFtZWQoZHJpdGVrLCBpODA0Ml9kcml0ZWssIGJvb2wsIDApOwogbW9kdWxl
X3BhcmFtX25hbWVkKGR1bWJrYmQsIGk4MDQyX2R1bWJrYmQsIGJvb2wsIDApOworbW9kdWxlX3Bh
cmFtX25hbWVkKGZvcmNlYXQyLCBpODA0Ml9mb3JjZWF0MiwgYm9vbCwgMCk7CiBtb2R1bGVfcGFy
YW1fbmFtZWQobm9hdXgsIGk4MDQyX25vYXV4LCBib29sLCAwKTsKIG1vZHVsZV9wYXJhbV9uYW1l
ZChub2tiZCwgaTgwNDJfbm9rYmQsIGJvb2wsIDApOwogbW9kdWxlX3BhcmFtX25hbWVkKG5vbXV4
LCBpODA0Ml9ub211eCwgYm9vbCwgMCk7CkBAIC0xMDA0LDYgKzEwMDcsMTYgQEAgc3RhdGljIGlu
dCBpODA0Ml9jb21tYW5kKHN0cnVjdCBpODA0Ml9wb3J0ICpwb3J0LCB1bnNpZ25lZCBjaGFyICpw
YXJhbSwgaW50IGNvbW0KIAkJcmV0dXJuIHJldHZhbDsKIAl9CiAKKwlpZiAoaTgwNDJfZm9yY2Vh
dDIgJiYgcG9ydCA9PSAmaTgwNDJfcG9ydHNbSTgwNDJfS0JEX1BPUlRdKSB7CisJCXJldHZhbCA9
IGk4MDQyX3dhaXRfd3JpdGUoKTsKKwkJaWYgKHJldHZhbCkKKwkJCXJldHVybiByZXR2YWw7CisK
KwkJZGJnKCIlMDJ4IC0+IGk4MDQyIChjb21tYW5kKSIsIEk4MDQyX0NNRF9TRVRfQVQyKTsKKwkJ
aTgwNDJfd3JpdGVfZGF0YShJODA0Ml9DTURfU0VUX0FUMik7CisJCWk4MDQyX3dyaXRlX2RhdGEo
MHgwMik7CisJfQorCiAJaWYgKGNvbW1hbmQgJiBJODA0Ml9DTURfQVVYX1NFTkQpIHsKIAkJcmV0
dmFsID0gaTgwNDJfd2FpdF93cml0ZSgpOwogCQlpZiAocmV0dmFsKQo=
--00000000000070ba1c060ab02150--

