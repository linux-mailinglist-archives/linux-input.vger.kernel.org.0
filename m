Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17E43825BE
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 21:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728831AbfHETul (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 15:50:41 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:35905 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727830AbfHETuk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Aug 2019 15:50:40 -0400
Received: by mail-wm1-f43.google.com with SMTP id g67so70038270wme.1
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2019 12:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:disposition-notification-to
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=oUW2Y+I3taHnY/UgWpCpByi9DBOAFr1Q1R6/RzWCrEY=;
        b=TtkwFcKlb86l+QWq/31UywwjVXlG3ENkQoXcl73QwGKDVRi3ybzo5V1ZYv+Lkw1L5p
         TFjMkOOs3XyKqPpfzIG3j6syKZ1jNIs0n+0WyHnKP6U+zMrOlhncERfB1/BX9Ob3mfRf
         Hva0jbGwQKhPskl4Oiuo6AQbhFf+KmDG4KxBV1H1fQAkaE6BaraUOViixAHooZSLGLT2
         QvUdx49MuFZ9H8Jsc+brVVmLx0tfxNqrHOM6bUQS5SQhOWd44L0MxGSvyB6hmYJLKVF8
         PMmXHpeYpHTZKGoh3+LDbh7ScoySgixUH/VTR8DuIi8zE6/KLoc4GDQbxRsB4kv82m4R
         94aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id
         :disposition-notification-to:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=oUW2Y+I3taHnY/UgWpCpByi9DBOAFr1Q1R6/RzWCrEY=;
        b=rRh0jUgy2JwGBlIQKaKM19nvP64/ynFi+JAO/LB6ayx+fkEkD6YnJEAXUNgnHF1cDy
         RrkBNnEQiCfWbI4i/90booYCVj57dAj3rsLxIXNB/exQD8U32xwvSXF4rXMIIUnKHsT1
         nXx9MEkvv9LHv0n6N/0gDpysdFKPul8UrmZfnbZVOv7bLPkVmWKus72fsLyxSSOXISlM
         U1sSYSbKSWNAR8kfX1JjaPNw4tkqE+1m9Y9jgV8z0wmnfYh5Qx/lbU2uOdIdJYjYOt44
         Z/qOgDnrWY/TT0fmrXChzIpSrICkXJFPQCMslmIuO5Fv0OdcQOWBIpXRrGesMyfBfx8l
         PqEw==
X-Gm-Message-State: APjAAAX35tKtfUwN8mNOq8cGZQeOMCJ0C0Za/VnzIqZMttmgtrCT3+US
        L6M0b1s/5nk/NWG/d43sshBNwQpM
X-Google-Smtp-Source: APXvYqzOH2XNgFBRZQ4rcFAwb8V2TLMD6wPHfaNCQ/+SImMXGQoi+ZoBZSVyBoXVwXj7ph5jG19PAg==
X-Received: by 2002:a1c:a909:: with SMTP id s9mr66560wme.20.1565034636874;
        Mon, 05 Aug 2019 12:50:36 -0700 (PDT)
Received: from ?IPv6:2a02:587:4d18:48b2:7f55:2f49:bc7c:7e3c? ([2a02:587:4d18:48b2:7f55:2f49:bc7c:7e3c])
        by smtp.gmail.com with ESMTPSA id 4sm197022975wro.78.2019.08.05.12.50.35
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 12:50:36 -0700 (PDT)
Subject: Re: Kernel support for joystick RAVCORE JAVELIN
From:   John Grs <johnpgrs@gmail.com>
To:     linux-input@vger.kernel.org
References: <ae53b87c-1544-bb6a-1d83-311ada4c580c@gmail.com>
Message-ID: <55dfec8d-c9de-6295-0695-7fc0aa6533bc@gmail.com>
Date:   Mon, 5 Aug 2019 22:50:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ae53b87c-1544-bb6a-1d83-311ada4c580c@gmail.com>
Content-Type: multipart/mixed;
 boundary="------------9F2417D66672441C4C754021"
Content-Language: el-GR
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a multi-part message in MIME format.
--------------9F2417D66672441C4C754021
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Στις 23/4/19 4:30 π.μ., ο John Grs έγραψε:
> After a couple of tries here my results.

Still 2 problems, but at least the hat works.

Problem 1) Only 7 of 8 direction works as for some reason the physical 
maximum value doesn't work (the correct value must be 240-30=210 equal 
to direction 7) so i put as logical maximum 14 and not the use 8 2) to 
correct the opposite direction of hat report count = 2 (??)



--------------9F2417D66672441C4C754021
Content-Type: text/x-csrc;
 name="hid-ravcore.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="hid-ravcore.c"

// SPDX-License-Identifier: GPL-2.0-or-later
/*
 *  HID driver for Ravcore Javelin & VKB Joysticks
 *  Currently supported devices are:
 *
 *    Ravcore Javelin: v11C0 p5607
 *
 *  Copyright (c) 2019 John Grs <johnpgrs@gmail.com>
*/


#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/device.h>
#include <linux/hid.h>

#define USB_VENDOR_ID_RAVCORE		0x11C0
#define USB_DEVICE_ID_RAVCORE_VKB5607	0x5607
#define DRIVER_DESC_RAVCORE		"RAVCORE JAVELIN driver"

static __u8 *ravcore_report_fixup(struct hid_device *hdev, __u8 *rdesc,	unsigned int *rsize)
{

	//fix descriptor for Hat Switch
	rdesc[177]=0x0D;		// Logigal Maximum = 12 (=360/30) + null
	rdesc[185]=0x04;		// Report Size = 4 to see it as HAT
	rdesc[187]=0x02;    

	hid_info(hdev, "Fix HID Descriptor: Ravcore Javelin\n");
	return rdesc;
}

static const struct hid_device_id ravcore_devices[] = {
	{ HID_USB_DEVICE(USB_VENDOR_ID_RAVCORE, USB_DEVICE_ID_RAVCORE_VKB5607) },
	{ }
};

MODULE_DEVICE_TABLE(hid, ravcore_devices);

static struct hid_driver ravcore_driver = {
	.name = "Ravcore Javelin",
	.id_table = ravcore_devices,
	.report_fixup = ravcore_report_fixup,
};

module_hid_driver(ravcore_driver);

MODULE_AUTHOR("John Grs <johnpgrs@gmail.com>");
MODULE_DESCRIPTION(DRIVER_DESC_RAVCORE);
MODULE_LICENSE("GPL");


--------------9F2417D66672441C4C754021
Content-Type: text/plain; charset=UTF-8;
 name="hid-ravcore.c.test"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="hid-ravcore.c.test"

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXIgR1BMLTIuMC1vci1sYXRlcgovKgogKiAgSElE
IGRyaXZlciBmb3IgUmF2Y29yZSBKYXZlbGluICYgVktCIEpveXN0aWNrcwogKiAgQ3VycmVu
dGx5IHN1cHBvcnRlZCBkZXZpY2VzIGFyZQogKgogKiAgICBSYXZjb3JlIEphdmVsaW4gdjEx
QzAgcDU2MDcKICoKICogIENvcHlyaWdodCAoYykgMjAxOSBKb2huIEdycyA8am9obnBncnNA
Z21haWwuY29tPgoqLwoKCiNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KI2luY2x1ZGUgPGxp
bnV4L21vZHVsZS5oPgojaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+CiNpbmNsdWRlIDxsaW51
eC9oaWQuaD4KCiNkZWZpbmUgVVNCX1ZFTkRPUl9JRF9SQVZDT1JFCSAgICAgIAkweDExQzAK
I2RlZmluZSBVU0JfREVWSUNFX0lEX1JBVkNPUkVfVktCNTYwNwkweDU2MDcKI2RlZmluZSBE
UklWRVJfREVTQ19SQVZDT1JFCQkgICAgICAiUkFWQ09SRSBKQVZFTElOIGRyaXZlciIKCnN0
YXRpYyB1OCBmaXhfcmRlc2NbXSA9IHsKIDB4MDUsIDB4MDEsIAkJLy8gVXNhZ2UgUGFnZSAn
R2VuZXJpYyBEZXNrdG9wIENvbnRyb2xzJwogMHgwOSwgMHgwNCwgCQkvLyBVc2FnZSAnSm95
c3RpY2snCiAweGExLCAweDAxLCAJCS8vIENvbGxlY3Rpb24gJ0FwcGxpY2F0aW9uIChtb3Vz
ZSwga2V5Ym9hcmQpJwogMHgwNSwgMHgwMSwgCQkvLyBVc2FnZSBQYWdlICdHZW5lcmljIERl
c2t0b3AgQ29udHJvbHMnCiAweDg1LCAweDAxLCAJCS8vIFJlcG9ydCBJRCA9IDEKIDB4MDUs
IDB4MDEsIAkJLy8gVXNhZ2UgUGFnZSAnR2VuZXJpYyBEZXNrdG9wIENvbnRyb2xzJwogMHgw
OSwgMHgzMCwgCQkvLyBVc2FnZSAnWCcKIDB4NzUsIDB4MTAsIAkJLy8gUmVwb3J0IFNpemUg
PSAxNgogMHg5NSwgMHgwMSwgCQkvLyBSZXBvcnQgQ291bnQgPSAxCiAweDE1LCAweDAwLCAJ
CS8vIExvZ2ljYWwgTWluaW11bSA9IDAKIDB4MjYsIDB4ZmYsIDB4MDcsICAJLy8gTG9naWNh
bCBNYXhpbXVtID0gMjA0NwogMHg0NiwgMHhmZiwgMHgwNywgIAkvLyBQaHlzaWNhbCBNYXhp
bXVtID0gMjA0NwogMHg4MSwgMHgwMiwgIAkJLy8gSW5wdXQgZGF0YSBbdmFyXSBhYnMgbGlu
IHByZWYtc3RhdGUgbnVsbC1wb3Mgbm9uLXZvbCBiaXQtZmllbGQKIDB4MDUsIDB4MDEsICAJ
CS8vIFVzYWdlIFBhZ2UgJ0dlbmVyaWMgRGVza3RvcCBDb250cm9scycKIDB4MDksIDB4MzEs
ICAJCS8vIFVzYWdlICdZJwogMHg3NSwgMHgxMCwgIAkJLy8gUmVwb3J0IFNpemUgPSAxNgog
MHg5NSwgMHgwMSwgIAkJLy8gUmVwb3J0IENvdW50ID0gMSAgIAogMHgxNSwgMHgwMCwgIAkJ
Ly8gTG9naWNhbCBNaW5pbXVtID0gMAogMHgyNiwgMHhmZiwgMHgwNywgIAkvLyBMb2dpY2Fs
IE1heGltdW0gPSAyMDQ3CiAweDQ2LCAweGZmLCAweDA3LCAgCS8vIFBoeXNpY2FsIE1heGlt
dW0gPSAyMDQ3CiAweDgxLCAweDAyLCAgCQkvLyBJbnB1dCBkYXRhIFt2YXJdIGFicyBsaW4g
cHJlZi1zdGF0ZSBudWxsLXBvcyBub24tdm9sIGJpdC1maWVsZAogMHgwNSwgMHgwMSwgIAkJ
Ly8gVXNhZ2UgUGFnZSAnR2VuZXJpYyBEZXNrdG9wIENvbnRyb2xzJwogMHgwOSwgMHgzMywg
ICAgCSAgICAgIC8vIFVzYWdlICdSeCcKIDB4NzUsIDB4MTAsICAJCS8vIFJlcG9ydCBTaXpl
ID0gMTYKIDB4OTUsIDB4MDEsICAJCS8vIFJlcG9ydCBDb3VudCA9IDEKIDB4MTUsIDB4MDAs
ICAJCS8vIExvZ2ljYWwgTWluaW11bSA9IDAKIDB4MjYsIDB4ZmYsIDB4MDMsICAJLy8gTG9n
aWNhbCBNYXhpbXVtID0gMTAyMwogMHg0NiwgMHhmZiwgMHgwMywgIAkvLyBQaHlzaWNhbCBN
YXhpbXVtID0gMTAyMwogMHg4MSwgMHgwMiwJCS8vIElucHV0IGRhdGEgW3Zhcl0gYWJzIGxp
biBwcmVmLXN0YXRlIG51bGwtcG9zIG5vbi12b2wgYml0LWZpZWxkCiAweDA1LCAweDAxLAkJ
Ly8gVXNhZ2UgUGFnZSAnR2VuZXJpYyBEZXNrdG9wIENvbnRyb2xzJwogMHgwNSwgMHgwMCwJ
CS8vIFVzYWdlIFBhZ2UgJ1VuZGVmaW5lZCcKIDB4MDksIDB4MDAsCQkvLyBVc2FnZSAnVW5k
ZWZpbmVkJwogMHg3NSwgMHgxMCwJCS8vIFJlcG9ydCBTaXplID0gMTYKIDB4OTUsIDB4MDEs
CQkvLyBSZXBvcnQgQ291bnQgPSAxCiAweDE1LCAweDAwLAkJLy8gTG9naWNhbCBNaW5pbXVt
ID0gMAogMHgyNiwgMHhmZiwgMHgwMywgIAkvLyBMb2dpY2FsIE1heGltdW0gPSAxMDIzCiAw
eDQ2LCAweGZmLCAweDAzLCAgCS8vIFBoeXNpY2FsIE1heGltdW0gPSAxMDIzCiAweDgxLCAw
eDAyLCAJCS8vIElucHV0IGRhdGEgW3Zhcl0gYWJzIGxpbiBwcmVmLXN0YXRlIG51bGwtcG9z
IG5vbi12b2wgYml0LWZpZWxkCiAweDA1LCAweDAxLCAJCS8vIFVzYWdlIFBhZ2UgJ0dlbmVy
aWMgRGVza3RvcCBDb250cm9scycKIDB4MDksIDB4MzIsIAkJLy8gVXNhZ2UgJ1onCiAweDc1
LCAweDEwLCAJCS8vIFJlcG9ydCBTaXplID0gMTYKIDB4OTUsIDB4MDEsIAkJLy8gUmVwb3J0
IENvdW50ID0gMQogMHgxNSwgMHgwMCwgCQkvLyBMb2dpY2FsIE1pbmltdW0gPSAwCiAweDI2
LCAweGZmLCAweDAzLCAgCS8vIExvZ2ljYWwgTWF4aW11bSA9IDEwMjMKIDB4NDYsIDB4ZmYs
IDB4MDMsICAJLy8gUGh5c2ljYWwgTWF4aW11bSA9IDEwMjMKIDB4ODEsIDB4MDIsIAkJLy8g
SW5wdXQgZGF0YSBbdmFyXSBhYnMgbGluIHByZWYtc3RhdGUgbnVsbC1wb3Mgbm9uLXZvbCBi
aXQtZmllbGQKIDB4MDUsIDB4MDEsIAkJLy8gVXNhZ2UgUGFnZSAnR2VuZXJpYyBEZXNrdG9w
IENvbnRyb2xzJwogMHgwOSwgMHgzNSwgCQkvLyBVc2FnZSAnUnonCiAweDc1LCAweDEwLCAJ
CS8vIFJlcG9ydCBTaXplID0gMTYKIDB4OTUsIDB4MDEsIAkJLy8gUmVwb3J0IENvdW50ID0g
MQogMHgxNSwgMHgwMCwgCQkvLyBMb2dpY2FsIE1pbmltdW0gPSAwCiAweDI2LCAweGZmLCAw
eDAzLCAgCS8vIExvZ2ljYWwgTWF4aW11bSA9IDEwMjMKIDB4NDYsIDB4ZmYsIDB4MDMsICAJ
Ly8gUGh5c2ljYWwgTWF4aW11bSA9IDEwMjMKIDB4ODEsIDB4MDIsIAkJLy8gSW5wdXQgZGF0
YSBbdmFyXSBhYnMgbGluIHByZWYtc3RhdGUgbnVsbC1wb3Mgbm9uLXZvbCBiaXQtZmllbGQK
IDB4MDUsIDB4MDEsIAkJLy8gVXNhZ2UgUGFnZSAnR2VuZXJpYyBEZXNrdG9wIENvbnRyb2xz
JwogMHgwOSwgMHgzNCwgCQkvLyBVc2FnZSAnUnknCiAweDc1LCAweDEwLCAJCS8vIFJlcG9y
dCBTaXplID0gMTYKIDB4OTUsIDB4MDEsIAkJLy8gUmVwb3J0IENvdW50ID0gMQogMHgxNSwg
MHgwMCwgCQkvLyBMb2dpY2FsIE1pbmltdW0gPSAwCiAweDI2LCAweGZmLCAweDA3LCAgCS8v
IExvZ2ljYWwgTWF4aW11bSA9IDIwNDcKIDB4NDYsIDB4ZmYsIDB4MDcsICAJLy8gUGh5c2lj
YWwgTWF4aW11bSA9IDIwNDcKIDB4ODEsIDB4MDIsICAJCS8vIElucHV0IGRhdGEgW3Zhcl0g
YWJzIGxpbiBwcmVmLXN0YXRlIG51bGwtcG9zIG5vbi12b2wgYml0LWZpZWxkCiAweDA1LCAw
eDAxLCAgCQkvLyBVc2FnZSBQYWdlICdHZW5lcmljIERlc2t0b3AgQ29udHJvbHMnCiAweDA5
LCAweDM2LCAgCQkvLyBVc2FnZSAnU2xpZGVyJwogMHg3NSwgMHgxMCwgIAkJLy8gUmVwb3J0
IFNpemUgPSAxNgogMHg5NSwgMHgwMSwgIAkJLy8gUmVwb3J0IENvdW50ID0gMQogMHgxNSwg
MHgwMCwgIAkJLy8gTG9naWNhbCBNaW5pbXVtID0gMAogMHgyNiwgMHhmZiwgMHgwMywgICAg
ICAvLyBMb2dpY2FsIE1heGltdW0gPSAxMDIzCiAweDQ2LCAweGZmLCAweDAzLCAgICAgIC8v
IFBoeXNpY2FsIE1heGltdW0gPSAxMDIzCiAweDgxLCAweDAyLCAgCSAgICAgIC8vIElucHV0
IGRhdGEgW3Zhcl0gYWJzIGxpbiBwcmVmLXN0YXRlIG51bGwtcG9zIG5vbi12b2wgYml0LWZp
ZWxkCiAweDA1LCAweDA5LCAgCSAgICAgIC8vIFVzYWdlIFBhZ2UgJ0J1dHRvbicKIDB4MTks
IDB4MDEsICAJICAgICAgLy8gVXNhZ2UgTWluaW11bSA9IDEKIDB4MmEsIDB4MWQsIDB4MDAs
ICAJLy8gVXNhZ2UgTWF4aW11bSA9IDI5CiAweDE1LCAweDAwLCAgCSAgICAgIC8vIExvZ2lj
YWwgTWluaW11bSA9IDAKIDB4MjUsIDB4MDEsICAJICAgICAgLy8gTG9naWNhbCBNYXhpbXVt
ID0gMQogMHg3NSwgMHgwMSwgIAkgICAgICAvLyBSZXBvcnQgU2l6ZSA9IDEKIDB4OTYsIDB4
ODAsIDB4MDAsICAJLy8gUmVwb3J0IENvdW50ID0gMTI4CiAweDgxLCAweDAyLCAgICAJICAg
ICAgLy8gSW5wdXQgZGF0YSBbdmFyXSBhYnMgbGluIHByZWYtc3RhdGUgbnVsbC1wb3Mgbm9u
LXZvbCBiaXQtZmllbGQKIDB4MDUsIDB4MDEsICAJICAgICAgLy8gVXNhZ2UgUGFnZSAnR2Vu
ZXJpYyBEZXNrdG9wIENvbnRyb2xzJwogMHgwOSwgMHgzOSwgIAkgICAgICAvLyBVc2FnZSAn
SGF0IHN3aXRjaCcKIDB4MTUsIDB4MDAsCiAweDI2LCAweDBkLCAweDAwLCAgCS8vIExvZ2lj
YWwgTWF4aW11bSA9IDIzOSAgLS1DSEFOR0VEIHRvIDBkIGZyb20gZWYKIDB4MzUsIDB4MDAs
CiAweDQ2LCAweGVmLCAweDAwLCAgCS8vIFBoeXNpY2FsIE1heGltdW0gPSAzNjAKIDB4NjUs
IDB4MTQsICAJICAgICAgLy8gVW5pdCA9IFN5c3RlbShFbmdsaXNoLVJvdGF0aW9uKSBMZW5n
dGgoQ2VudGltZXRlcikKIDB4NzUsIDB4MDQsICAJICAgICAgLy8gUmVwb3J0IFNpemUgPSAx
NiAgLS1DSEFOR0VEIHRvIDA0IGZyb20gMTAtLQogMHg5NSwgMHgwMiwgIAkgICAgICAvLyBS
ZXBvcnQgQ291bnQgPSAxCiAweDgxLCAweDQyLCAgCSAgICAgIC8vIElucHV0IGRhdGEgW3Zh
cl0gYWJzIGxpbiBwcmVmLXN0YXRlIG51bGwtcG9zIFt2b2xdIGJpdC1maWVsZAogMHgwNSwg
MHgwMSwgIAkgICAgICAvLyBVc2FnZSBQYWdlICdHZW5lcmljIERlc2t0b3AgQ29udHJvbHMn
CiAweDA5LCAweDAwLCAgCSAgICAgIC8vIFVzYWdlICdVbmRlZmluZWQnCiAweDc1LCAweDA4
LCAgCSAgICAgIC8vIFJlcG9ydCBTaXplID0gOAogMHg5NSwgMHgxZCwgIAkgICAgICAvLyBS
ZXBvcnQgQ291bnQgPSAyOQogMHg4MSwgMHgwMSwgIAkgICAgICAvLyBJbnB1dCBbY29uc3Rd
IGFycmF5IGFicyBsaW4gcHJlZi1zdGF0ZSBudWxsLXBvcyBub24tdm9sIGJpdC1maWVsZAog
MHg4NSwgMHgwOCwgIAkgICAgICAvLyBSZXBvcnQgSUQgPSA4CiAweDA1LCAweDAxLCAgCSAg
ICAgIC8vIFVzYWdlICBQYWdlICdHZW5lcmljIERlc2t0b3AgQ29udHJvbHMnCiAweDA5LCAw
eDAwLCAgCSAgICAgIC8vIFVzYWdlICdVbmRlZmluZWQnCiAweDc1LCAweDA4LCAgCSAgICAg
IC8vIFJlcG9ydCBTaXplID0gOAogMHg5NSwgMHgzZiwgIAkgICAgICAvLyBSZXBvcnQgQ291
bnQgPSA2MwogMHg4MSwgMHgwMSwgIAkgICAgICAvLyBJbnB1dCBbY29uc3RdIGFycmF5IGFi
cyBsaW4gcHJlZi1zdGF0ZSBudWxsLXBvcyBub24tdm9sIGJpdC1maWVsZAogMHgxNSwgMHgw
MCwgIAkgICAgICAvLyBMb2dpY2FsIE1pbmltdW0gPSAwCiAweDI2LCAweGZmLCAweDAwLCAg
CS8vIExvZ2ljYWwgTWF4aW11bSA9IDI1NQogMHg0NiwgMHhmZiwgMHgwMCwgIAkvLyBQaHlz
aWNhbCBNYXhpbXVtID0gMjU1CiAweDg1LCAweDU4LAogMHg3NSwgMHgwOCwgIAkgICAgICAv
LyBSZXBvcnQgU2l6ZSA9IDgKIDB4OTUsIDB4M2YsICAJICAgICAgLy8gUmVwb3J0IENvdW50
ID0gNjMKIDB4MDksIDB4MDAsICAJICAgICAgLy8gVXNhZ2UgJ1VuZGVmaW5lZCcKIDB4OTEs
IDB4MDIsICAJIAogMHg4NSwgMHg1OSwKIDB4NzUsIDB4MDgsICAJICAgICAgLy8gUmVwb3J0
IFNpemUgPSA4CiAweDk1LCAweDgwLCAgCSAgICAgIC8vIFJlcG9ydCBDb3VudCA9IDEyOAog
MHgwOSwgMHgwMCwgIAkgICAgICAvLyBVc2FnZSAnVW5kZWZpbmVkJwogMHhiMSwgMHgwMiwK
IDB4YzAsICAgICAgICAgICAgICAgICAgLy8gRW5kIENvbGxlY3Rpb24KfTsKCgpzdGF0aWMg
X191OCAqcmF2Y29yZV9yZXBvcnRfZml4dXAoc3RydWN0IGhpZF9kZXZpY2UgKmhkZXYsIF9f
dTggKnJkZXNjLAl1bnNpZ25lZCBpbnQgKnJzaXplKQp7CgoJLy9maXggZGVzY3JpcHRvciBm
b3IgSGF0IFN3aXRjaAoJCgloaWRfaW5mbyhoZGV2LCAiRml4aW5nIHVwIEhJRCBEZXNjcmlw
dG9yIGZvciBSYXZjb3JlIEphdmVsaW5cbiIpOwoKCXJkZXNjID0gZml4X3JkZXNjOwoJKnJz
aXplID0gc2l6ZW9mKGZpeF9yZGVzYyk7CgoJcmV0dXJuIHJkZXNjOwp9CgpzdGF0aWMgY29u
c3Qgc3RydWN0IGhpZF9kZXZpY2VfaWQgcmF2Y29yZV9kZXZpY2VzW10gPSB7Cgl7IEhJRF9V
U0JfREVWSUNFKFVTQl9WRU5ET1JfSURfUkFWQ09SRSwgVVNCX0RFVklDRV9JRF9SQVZDT1JF
X1ZLQjU2MDcpIH0sCgl7IH0KfTsKCk1PRFVMRV9ERVZJQ0VfVEFCTEUoaGlkLCByYXZjb3Jl
X2RldmljZXMpOwoKc3RhdGljIHN0cnVjdCBoaWRfZHJpdmVyIHJhdmNvcmVfZHJpdmVyID0g
ewoJLm5hbWUgPSAiUmF2Y29yZSBKYXZlbGluIiwKCS5pZF90YWJsZSA9IHJhdmNvcmVfZGV2
aWNlcywKCS5yZXBvcnRfZml4dXAgPSByYXZjb3JlX3JlcG9ydF9maXh1cCwKfTsKCm1vZHVs
ZV9oaWRfZHJpdmVyKHJhdmNvcmVfZHJpdmVyKTsKCk1PRFVMRV9BVVRIT1IoIkpvaG4gR3Jz
IDxqb2hucGdyc0BnbWFpbC5jb20+Iik7Ck1PRFVMRV9ERVNDUklQVElPTihEUklWRVJfREVT
Q19SQVZDT1JFKTsKTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwoK
--------------9F2417D66672441C4C754021
Content-Type: application/x-pcapng;
 name="RAVCORE_DEFAULT.pcapng"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="RAVCORE_DEFAULT.pcapng"

Cg0NCrAAAABNPCsaAQAAAP//////////AgA2AEludGVsKFIpIENvcmUoVE0pIGk3LTg3NTBI
IENQVSBAIDIuMjBHSHogKHdpdGggU1NFNC4yKQAAAwAVAExpbnV4IDUuMi4yLTEtTUFOSkFS
TwAAAAQAMwBEdW1wY2FwIChXaXJlc2hhcmspIDMuMC4yIChHaXQgY29tbWl0IDYyMWVkMzUx
ZDVjOSkAAAAAALAAAAABAAAASAAAANwAAAAAAAQAAgAHAHVzYm1vbjEACQABAAYAAAAMABUA
TGludXggNS4yLjItMS1NQU5KQVJPAAAAAAAAAEgAAAAGAAAAVAEAAAAAAACbjgUADKAj5DEB
AAAxAQAAAOlCF52I//9DAoAKAQAtAOpqO10AAAAAjJECAAAAAADxAAAA8QAAAAAAAAAAAAAA
AAAAAAAAAAAAAgAAAAAAAAUBCQShAQUBhQEFAQkwdRCVARUAJv8HRv8HgQIFAQkxdRCVARUA
Jv8HRv8HgQIFAQkzdRCVARUAJv8DRv8DgQIFAAkAdRCVARUAJv8DRv8DgQIFAQkydRCVARUA
Jv8DRv8DgQIFAQk1dRCVARUAJv8DRv8DgQIFAQk0dRCVARUAJv8HRv8HgQIFAQk2dRCVARUA
Jv8DRv8DgQIFCRkBKh0AFQAlAXUBloAAgQIFAQk5Ju8ARmgBZRR1EJUBgUIFAQkAdQiVHYEB
hQgFAQkAdQiVP4EBFQAm/wBG/wCFWHUIlT8JAJEChVl1CJWACQCxAsAAAABUAQAA
--------------9F2417D66672441C4C754021--
