Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E43C250152
	for <lists+linux-input@lfdr.de>; Mon, 24 Aug 2020 17:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgHXPn3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Aug 2020 11:43:29 -0400
Received: from mx01-sz.bfs.de ([194.94.69.67]:56880 "EHLO mx01-sz.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726473AbgHXPnR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Aug 2020 11:43:17 -0400
X-Greylist: delayed 465 seconds by postgrey-1.27 at vger.kernel.org; Mon, 24 Aug 2020 11:43:08 EDT
Received: from SRVEX01-SZ.bfs.intern (exchange-sz.bfs.de [10.129.90.31])
        by mx01-sz.bfs.de (Postfix) with ESMTPS id 3A1CF20443;
        Mon, 24 Aug 2020 17:35:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1598283317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eRzgFGh9/BntiqGMWEsiZTSABhsVMBDixd2/cOXtNic=;
        b=W883IKrtXCl6w24SgX1GtliiAQSPPfxD61Ue1YMCpYT7W9I2Ep5YG1gAV+J1xnilaIf2Ar
        XJjsMTikvD/ac7kWw89AyKu9Ihm6UNS3gMi6M0Pv1vnd+s552ytTNSzlH16TxEzn2s6gdD
        z6sXmOhy3LJmpYtIXC55Swei+FHkDkYvv9sODLyj/Ym29ZWRsHla7AXz2Fn2iQ+pvM3etF
        dHb/QF9G7N983wJcDFtF2EJ4eV0A8ApeoMA58t0nhGfWkLaenozj0wWugs+Hwl6xPzTpsw
        5yg83Bwcwn8KjZu09fUVTLZ/AYE2tz8UKOEjq5q3985B91cgYqBIADtpemd8iA==
Received: from SRVEX01-SZ.bfs.intern (10.129.90.31) by SRVEX01-SZ.bfs.intern
 (10.129.90.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Mon, 24 Aug
 2020 17:35:16 +0200
Received: from SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a]) by
 SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a%6]) with mapi id
 15.01.2044.004; Mon, 24 Aug 2020 17:35:16 +0200
From:   Walter Harms <wharms@bfs.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Stefan Achatz <erazor_de@users.sourceforge.net>
CC:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: AW: [PATCH v2] HID: roccat: add bounds checking in
 kone_sysfs_write_settings()
Thread-Topic: [PATCH v2] HID: roccat: add bounds checking in
 kone_sysfs_write_settings()
Thread-Index: AQHWefToEl9avbae1kGQ4FmFDoAFsalHYb09
Date:   Mon, 24 Aug 2020 15:35:16 +0000
Message-ID: <ab4625b2b2ea41dd83ff9e192a027f41@bfs.de>
References: <1597819984.4101.16.camel@web.de>,<20200824085735.GA208317@mwanda>
In-Reply-To: <20200824085735.GA208317@mwanda>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.137.16.40]
x-tm-as-product-ver: SMEX-14.0.0.3031-8.6.1012-25624.000
x-tm-as-result: No-10--8.314400-5.000000
x-tmase-matchedrid: 7icOwTYiHK3RubRCcrbc5pzEHTUOuMX33dCmvEa6IiG4eDpiBrUciGr4
        /y/RCSUy0Hoi1fEaP4qN5vNGwyZ1KF1McTGy89+ei82UiskMqcwwQTzTIFJCzoxRWJphhsrcQT3
        oROdvH1vQftcvF9LRG8ZHJ++jFzpIIjM2rMmDTQPHsv3gEadaxCHxHXwnWAXc13GjbR1NJrEmgo
        5BSqf/niJoNo9EQ2Zq4zBrQSJZSTkfKML5AJtfLQLiZxZUfodHp2Uv2mII684IFWSswluXgnWCd
        6QvVzbex2BEc3TqpBiIZm0VEEWEK3J+EgEMl5xOKSfEqVU/Tv8GchEhVwJY30oPLn6eZ90+i836
        2cmVmYBGjk/QOKmZVVvy4imyA8gdbu8QqMQjwvLC0TXpqtexIkq4gufanRIyzKXGJgSfagbQGFl
        KOB0iJEqna2uFlro8j0IvV7jlqDhyPzMTUSO1JIph1hAtvKZN7VGXkoWCELlzORjGZHjERrZUKC
        nFEZZuZx0Cdo1A6e9ftuJwrFEhTY2j49Ftap9EOwBXM346/+wf23iD7YgwEwwq4Etiqzo8+GDOl
        f6Gop5k2MZOGWKdRA3k+0LX9UYI
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--8.314400-5.000000
x-tmase-version: SMEX-14.0.0.3031-8.6.1012-25624.000
x-tm-snts-smtp: 2D30FE7C49BE24CBF31F0FC3A7CCC177A453A6351CC867F95BC01E273150AA3A2000:9
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=-0.00
Authentication-Results: mx01-sz.bfs.de;
        none
X-Spamd-Result: default: False [-0.00 / 7.00];
         ARC_NA(0.00)[];
         TO_DN_EQ_ADDR_SOME(0.00)[];
         HAS_XOIP(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         DKIM_SIGNED(0.00)[];
         RCPT_COUNT_SEVEN(0.00)[7];
         NEURAL_HAM(-0.00)[-1.033];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-0.00)[19.08%]
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

hello Dan,=20

i notice that you can shorten the line to:
(line above checks for count=3D=3Dsizeof(struct kone_settings))

difference =3D memcmp(settings, &kone->settings, count);

nothing special just to shorten the line and make use of count.

and just to save one indent level and because its  readabel nicely:
    if ( ! difference )=20
          goto unlock;

hope that helps

re,
 wh
________________________________________
Von: kernel-janitors-owner@vger.kernel.org [kernel-janitors-owner@vger.kern=
el.org] im Auftrag von Dan Carpenter [dan.carpenter@oracle.com]
Gesendet: Montag, 24. August 2020 10:57
An: Stefan Achatz
Cc: Jiri Kosina; Benjamin Tissoires; linux-input@vger.kernel.org; linux-ker=
nel@vger.kernel.org; kernel-janitors@vger.kernel.org
Betreff: [PATCH v2] HID: roccat: add bounds checking in kone_sysfs_write_se=
ttings()

This code doesn't check if "settings->startup_profile" is within bounds
and that could result in an out of bounds array access.  What the code
does do is it checks if the settings can be written to the firmware, so
it's possible that the firmware has a bounds check?  It's safer and
easier to verify when the bounds checking is done in the kernel.

Fixes: 14bf62cde794 ("HID: add driver for Roccat Kone gaming mouse")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:  In the v1 patch I added a check against settings->size but that's
potentially too strict so it was removed.

 drivers/hid/hid-roccat-kone.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-kone.c
index 2ff4c8e366ff..1ca64481145e 100644
--- a/drivers/hid/hid-roccat-kone.c
+++ b/drivers/hid/hid-roccat-kone.c
@@ -294,31 +294,40 @@ static ssize_t kone_sysfs_write_settings(struct file =
*fp, struct kobject *kobj,
        struct kone_device *kone =3D hid_get_drvdata(dev_get_drvdata(dev));
        struct usb_device *usb_dev =3D interface_to_usbdev(to_usb_interface=
(dev));
        int retval =3D 0, difference, old_profile;
+       struct kone_settings *settings =3D (struct kone_settings *)buf;

        /* I need to get my data in one piece */
        if (off !=3D 0 || count !=3D sizeof(struct kone_settings))
                return -EINVAL;

        mutex_lock(&kone->kone_lock);
-       difference =3D memcmp(buf, &kone->settings, sizeof(struct kone_sett=
ings));
+       difference =3D memcmp(settings, &kone->settings,
+                           sizeof(struct kone_settings));
        if (difference) {
-               retval =3D kone_set_settings(usb_dev,
-                               (struct kone_settings const *)buf);
-               if (retval) {
-                       mutex_unlock(&kone->kone_lock);
-                       return retval;
+               if (settings->startup_profile < 1 ||
+                   settings->startup_profile > 5) {
+                       retval =3D -EINVAL;
+                       goto unlock;
                }

+               retval =3D kone_set_settings(usb_dev, settings);
+               if (retval)
+                       goto unlock;
+
                old_profile =3D kone->settings.startup_profile;
-               memcpy(&kone->settings, buf, sizeof(struct kone_settings));
+               memcpy(&kone->settings, settings, sizeof(struct kone_settin=
gs));

                kone_profile_activated(kone, kone->settings.startup_profile=
);

                if (kone->settings.startup_profile !=3D old_profile)
                        kone_profile_report(kone, kone->settings.startup_pr=
ofile);
        }
+unlock:
        mutex_unlock(&kone->kone_lock);

+       if (retval)
+               return retval;
+
        return sizeof(struct kone_settings);
 }
 static BIN_ATTR(settings, 0660, kone_sysfs_read_settings,
--
2.28.0

