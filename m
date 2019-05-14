Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9D91CF83
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2019 21:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbfENTAi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 May 2019 15:00:38 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36880 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbfENTAh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 May 2019 15:00:37 -0400
Received: by mail-wm1-f66.google.com with SMTP id 7so174648wmo.2;
        Tue, 14 May 2019 12:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:cc:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=9JYN5xzhocSIglmrjAdysDK4dh65giGpdMAvsJFJJPY=;
        b=bnw4+f4VuntzkI+xNK+UL5Y9TBkyQNyV2rFO1J/BdlRVHAFJUmJw5p4avlkaTep9zw
         yzZvHk60Zeujrjmm5sWJhh5K7b+by/BSGaZ+zp+xZTkWw27JIS1a5UHs/o1Ne1K9Xypm
         drZOSQTaYc2P2d0mPE0jGbvbSZ+EmENDDrg3yN4dpHEv+xFFY5ny3HhGBikLqUfrv9ZW
         wHByoUYVIXJfd16ZmlBzMKNp5wNgbKC9dRiO8EoPbuVbXqDgZF2eCx3lIAG+rmI/IbkI
         LaqcqeOvN//hllIJ/6cCIddIoIdfU26lGIf13bGgxTeZlYdsb/lSu+Qs0TRkqaf2QsDw
         unyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9JYN5xzhocSIglmrjAdysDK4dh65giGpdMAvsJFJJPY=;
        b=cr5dR9LlghqwUYAbsR4kVtHzYLXb1tk9Dxacx0RMYjVBtqkruKy3S8ptxXR56/eghf
         Z8yBMlprnx28Rf/BEVrXmUSsk5t37JHbKLLNgndRNr9kYARt+QX9ciJJyQByUHQ92jrY
         1r9wj8gO93EAl0lmIzWc30Jf2k1GaWLbRYNHr4p6X0YGL6uIZeSJywOthXaWsCGm0jOu
         H7s1y1fPraY1w2pMicw4AY1GgC9rSsopdLQhsZAgA+jptTqng78E0t1dfGAUhHpKVr9R
         oozKb196Wu0k2BfR48Ke4dAiktRboVW7uuz27IJ7+hma9TjGYSeHpIvVO7OxuK5mtDQv
         E/9A==
X-Gm-Message-State: APjAAAVgxGdOHqWFOlCB7nlL850ADhWaf6UklYQDXknINDWkDFY6F05H
        0VOQDhcYMooMGhV4hh3/5crLJ//zwpA=
X-Google-Smtp-Source: APXvYqwH6CnDSNclbIqoYhw2TUiwGx48ELojPYaEp/66QlUy6nqSg2Sbws0ZyFLMiYqUvI+EBIB3HA==
X-Received: by 2002:a1c:ca0b:: with SMTP id a11mr20885165wmg.52.1557860434790;
        Tue, 14 May 2019 12:00:34 -0700 (PDT)
Received: from [192.168.20.141] ([194.99.104.18])
        by smtp.gmail.com with ESMTPSA id l14sm16996166wrt.57.2019.05.14.12.00.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 12:00:34 -0700 (PDT)
Subject: [PATCH v4 05/13] platform/x86: asus-wmi: Improve DSTS WMI method ID
 detection
From:   Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Daniel Drake <drake@endlessm.com>,
        Chris Chiu <chiu@endlessm.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com>
Message-ID: <34f49a73-a556-9e5a-fa07-938d43ac6225@gmail.com>
Date:   Tue, 14 May 2019 21:00:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The DSTS method detection mistakenly selects DCTS instead of DSTS if
nothing is returned when the method ID is not defined in WMNB. As a result,
the control of keyboard backlight is not functional for TUF Gaming series
laptops. Implement detection based on _UID of the WMI device instead.

There is evidence that DCTS is handled by ACPI WMI devices that have _UID
ASUSWMI, whereas none of the devices without ASUSWMI respond to DCTS and
DSTS is used instead [1].

DSDT examples:

FX505GM (_UID ATK):
Method (WMNB, 3, Serialized)
{ ...
    If ((Local0 == 0x53545344))
    {
        ...
        Return (Zero)
    }
    ...
    // No return
}

K54C (_UID ATK):
Method (WMNB, 3, Serialized)
{ ...
    If ((Local0 == 0x53545344))
    {
        ...
        Return (0x02)
    }
    ...
    Return (0xFFFFFFFE)
}

[1] Link: https://lkml.org/lkml/2019/4/11/322

Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Suggested-by: Daniel Drake <drake@endlessm.com>

---
Depends on the previous patch in the series that adds method to
wmi module.
---
 drivers/hid/hid-asus.c                     |  2 +-
 drivers/platform/x86/asus-wmi.c            | 23 +++++++++++++++++++---
 include/linux/platform_data/x86/asus-wmi.h |  4 ++--
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 336aeaed1159..1d01fe23ca0c 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -396,7 +396,7 @@ static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
 	if (!IS_ENABLED(CONFIG_ASUS_WMI))
 		return false;
 
-	ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS2,
+	ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
 				       ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
 	hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
 	if (ret)
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 6b35c1f00a3e..5bdb4ffdbee3 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -83,6 +83,8 @@ MODULE_LICENSE("GPL");
 #define USB_INTEL_XUSB2PR		0xD0
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
 
+#define ASUS_ACPI_UID_ASUSWMI		"ASUSWMI"
+
 static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
 
 static bool ashs_present(void)
@@ -1874,6 +1876,8 @@ static int asus_wmi_sysfs_init(struct platform_device *device)
  */
 static int asus_wmi_platform_init(struct asus_wmi *asus)
 {
+	struct device *dev = &asus->platform_device->dev;
+	char *wmi_uid;
 	int rv;
 
 	/* INIT enable hotkeys on some models */
@@ -1903,11 +1907,24 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 	 * Note, on most Eeepc, there is no way to check if a method exist
 	 * or note, while on notebooks, they returns 0xFFFFFFFE on failure,
 	 * but once again, SPEC may probably be used for that kind of things.
+	 *
+	 * Additionally at least TUF Gaming series laptops return nothing for
+	 * unknown methods, so the detection in this way is not possible.
+	 *
+	 * There is strong indication that only ACPI WMI devices that have _UID
+	 * equal to "ASUSWMI" use DCTS whereas those with "ATK" use DSTS.
 	 */
-	if (!asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, 0, 0, NULL))
+	wmi_uid = wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
+	if (!wmi_uid)
+		return -ENODEV;
+
+	if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI)) {
+		dev_info(dev, "Detected ASUSWMI, use DCTS\n");
+		asus->dsts_id = ASUS_WMI_METHODID_DCTS;
+	} else {
+		dev_info(dev, "Detected %s, not ASUSWMI, use DSTS\n", wmi_uid);
 		asus->dsts_id = ASUS_WMI_METHODID_DSTS;
-	else
-		asus->dsts_id = ASUS_WMI_METHODID_DSTS2;
+	}
 
 	/* CWAP allow to define the behavior of the Fn+F2 key,
 	 * this method doesn't seems to be present on Eee PCs */
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index bfba245636a7..0668f76df921 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -18,8 +18,8 @@
 #define ASUS_WMI_METHODID_GDSP		0x50534447 /* Get DiSPlay output */
 #define ASUS_WMI_METHODID_DEVP		0x50564544 /* DEVice Policy */
 #define ASUS_WMI_METHODID_OSVR		0x5256534F /* OS VeRsion */
-#define ASUS_WMI_METHODID_DSTS		0x53544344 /* Device STatuS */
-#define ASUS_WMI_METHODID_DSTS2		0x53545344 /* Device STatuS #2*/
+#define ASUS_WMI_METHODID_DCTS		0x53544344 /* Device status (DCTS) */
+#define ASUS_WMI_METHODID_DSTS		0x53545344 /* Device status (DSTS) */
 #define ASUS_WMI_METHODID_BSTS		0x53545342 /* Bios STatuS ? */
 #define ASUS_WMI_METHODID_DEVS		0x53564544 /* DEVice Set */
 #define ASUS_WMI_METHODID_CFVS		0x53564643 /* CPU Frequency Volt Set */
-- 
2.17.1

