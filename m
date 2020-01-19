Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED4EF141F4E
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2020 19:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbgASSPE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Jan 2020 13:15:04 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44222 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbgASSPE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Jan 2020 13:15:04 -0500
Received: by mail-ot1-f66.google.com with SMTP id h9so26690793otj.11
        for <linux-input@vger.kernel.org>; Sun, 19 Jan 2020 10:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=0MrTpv+HDBPNR7/4Dq9BS8nqKwI3pL3S3fRcWBhKH8Q=;
        b=PYexgQoI3cAhnYcApsrqj/TQjYXLL+1uRDWhtf50u6undgDWhrn+nrGTq8yQdlz3VQ
         kLcyWkCYpbdU5nW7pcqZGXl4O4pCtJDXtuBH+1OGVxtRDHe8yNTQvcTu1FjVcbRXr87z
         R6Zg5NFRuCetsm0wMGb6Z8lijzN818BaUWXnioXqcPTJEPUhzpye3qXCU0GED0dPaww0
         vNkFKlHv8YbrVRiAP2VMB9pIj/GLz+O4xdbhrhsHx+d4e5K0eGQENmbfyhT2zdJoJLx4
         LmwGX7pmdEdq1xgrCXB9MZiIJGQFrmJb7fcuWV42jdsjTr1Yl37Xj1P0kutWZIl0Uzx9
         TfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=0MrTpv+HDBPNR7/4Dq9BS8nqKwI3pL3S3fRcWBhKH8Q=;
        b=QHuztbz/RX/dvGqq0dw1L8DBvoRTVM5YphbraBm8E/S9Vg05eM6nwLFD10sobD2GB5
         52dQYWNgHpp66/XJ4hy1qhheoLURUhY9owZu8M4hjOzxGwgMHUZ1mCNNrLoJihCOD0m6
         jNhqP/axvA2EpJRo7J3AgO8g8zJ+O3x3a3wjKY6c6jsLxQuuCfRuWQ++1tg074Sgj3pK
         +bNX7Q0Lh47khOyzsC8Z9yqKAywmYsqr5l758NhEcJuc3vR4pemBHxkqV7K8qgtpkQx4
         TXigz6G47ZgMUDAbpL1aA4vZ+e8xmTk0VjVRIJmCKEZb94n0FbwzDclsy8WfXZrU4lZL
         Msug==
X-Gm-Message-State: APjAAAU0KDkKWyBam5gjdeyGVT6Op2NSg0cwqb19nqX/LmAb4zP6a2Vz
        zHzDbqZPLsPwuHYW6ZOVZEn4nqZNntl/1CEJfqE=
X-Google-Smtp-Source: APXvYqxEXwda8VmpqokD8xMmyIFiIVfS7sUH8TtvqVXK+jboAh7i2riHS9cOuOD5w2R3c62U6wezYGjShsso3ENrD7w=
X-Received: by 2002:a9d:7d85:: with SMTP id j5mr13457255otn.86.1579457703379;
 Sun, 19 Jan 2020 10:15:03 -0800 (PST)
MIME-Version: 1.0
From:   js <sym.i.nem@gmail.com>
Date:   Sun, 19 Jan 2020 13:14:52 -0500
Message-ID: <CAKsRvPPjk7RZanEwO3hVa+UZ9_zq6xWakOxckBfx-a+_bEgUtA@mail.gmail.com>
Subject: [BUG + PATCH] HID ELAN9038 probe fails with "report is too long"
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: multipart/mixed; boundary="000000000000591ab2059c8227f4"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--000000000000591ab2059c8227f4
Content-Type: text/plain; charset="UTF-8"

i posted this bug to bugzilla with the attached patch.
this email is to notify the maintainers.
https://bugzilla.kernel.org/show_bug.cgi?id=206259

thanks!

js
----

ELAN i2c digitizer on microsoft surface go fails to initialize and
device is non-functional

initialization fails on 4.19.96:
----
[    5.507245] hid-generic 0018:04F3:261A.0005: report is too long
[    5.507256] hid-generic 0018:04F3:261A.0005: item 0 1 0 8 parsing failed
[    5.507290] hid-generic: probe of 0018:04F3:261A.0005 failed with error -22
[    5.556409] hid-multitouch 0018:04F3:261A.0005: report is too long
[    5.581641] hid-multitouch 0018:04F3:261A.0005: item 0 1 0 8 parsing failed
[    5.618495] hid-multitouch: probe of 0018:04F3:261A.0005 failed
with error -22

initialization succeeds on 4.19.95:
----
[    7.150887] hid-generic 0018:04F3:261A.0001: input,hidraw2: I2C HID
v1.00 Device [ELAN9038:00 04F3:261A] on i2c-ELAN9038:00
[    8.253077] input: ELAN9038:00 04F3:261A as
/devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-ELAN9038:00/0018:04F3:261A.0001/input/input20
[    8.253219] input: ELAN9038:00 04F3:261A Pen as
/devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-ELAN9038:00/0018:04F3:261A.0001/input/input23
[    8.253330] hid-multitouch 0018:04F3:261A.0001: input,hidraw0: I2C
HID v1.00 Device [ELAN9038:00 04F3:261A] on i2c-ELAN9038:00

problem seems to be due to this commit:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-4.19.y&id=31d06cc8e7caec36bedeb4f90444920431462f61

--000000000000591ab2059c8227f4
Content-Type: text/x-patch; charset="US-ASCII"; name="hid-core.patch"
Content-Disposition: attachment; filename="hid-core.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k5lc9yxb0>
X-Attachment-Id: f_k5lc9yxb0

ZGlmZiAtcnVwTiBsaW51eC00LjE5Ljk3L2RyaXZlcnMvaGlkL2hpZC1jb3JlLmMgbGludXgtNC4x
OS45Ny0xL2RyaXZlcnMvaGlkL2hpZC1jb3JlLmMKLS0tIGxpbnV4LTQuMTkuOTcvZHJpdmVycy9o
aWQvaGlkLWNvcmUuYwkyMDIwLTAxLTE3IDE4OjQ3OjE3LjAwMDAwMDAwMCArMDAwMAorKysgbGlu
dXgtNC4xOS45Ny0xL2RyaXZlcnMvaGlkL2hpZC1jb3JlLmMJMjAyMC0wMS0xOSAxNjozMTozMS44
MjMwMDU5NzcgKzAwMDAKQEAgLTI5MCw4ICsyOTAsMTEgQEAgc3RhdGljIGludCBoaWRfYWRkX2Zp
ZWxkKHN0cnVjdCBoaWRfcGFycwogCiAJLyogVG90YWwgc2l6ZSBjaGVjazogQWxsb3cgZm9yIHBv
c3NpYmxlIHJlcG9ydCBpbmRleCBieXRlICovCiAJaWYgKHJlcG9ydC0+c2l6ZSA+IChISURfTUFY
X0JVRkZFUl9TSVpFIC0gMSkgPDwgMykgewotCQloaWRfZXJyKHBhcnNlci0+ZGV2aWNlLCAicmVw
b3J0IGlzIHRvbyBsb25nXG4iKTsKLQkJcmV0dXJuIC0xOworCQloaWRfZXJyKHBhcnNlci0+ZGV2
aWNlLAorCQkJCSJyZXBvcnQgaXMgdG9vIGxvbmc6ICVkID4gJWRcbiIsCisJCQkJcmVwb3J0LT5z
aXplLAorCQkJCShISURfTUFYX0JVRkZFUl9TSVpFIC0gMSkgPDwgMyk7CisJCXJldHVybiAwOwog
CX0KIAogCWlmICghcGFyc2VyLT5sb2NhbC51c2FnZV9pbmRleCkgLyogSWdub3JlIHBhZGRpbmcg
ZmllbGRzICovCg==
--000000000000591ab2059c8227f4--
