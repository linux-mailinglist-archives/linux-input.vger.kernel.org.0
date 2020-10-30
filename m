Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDACF2A0823
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 15:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgJ3OkU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 10:40:20 -0400
Received: from mx01-sz.bfs.de ([194.94.69.67]:59470 "EHLO mx01-sz.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725975AbgJ3OkT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 10:40:19 -0400
Received: from SRVEX01-SZ.bfs.intern (exchange-sz.bfs.de [10.129.90.31])
        by mx01-sz.bfs.de (Postfix) with ESMTPS id 4D43620376;
        Fri, 30 Oct 2020 15:40:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1604068817;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jZnQpOQ/iSFZgnx0ImVpwj+MiYVyArc7pKEbMLyMQfo=;
        b=Kf/3QG1UDjQ8arSPYw6fY20I2SBA0AWN8RJCPryJo7URn646CV33Z20EkGV2EnroFw/Qe1
        0HilhpjViDMer8RC1znJOz1w4AqvqthANeam5c7STONWNm0JUUCHV1f5z530o2bXjAbSXX
        ovqeyKZAl0gcIRPnkHXMdAup1yZ3nqBdcu8CGYjnKP89/DJ8mR6rxNY5BQBS0ckyaIPyvo
        /oEJU8Y7e5XUO9i9SkiU/0KoNEodpEy5fdIoPjq9iS2aYhzOvo12xHXVqoGZQfb9Wg6Eqx
        ZjnfR1hIw3qsZlStZRxGIIS/ww+A3PP0XzrgsLicl8NFzhe3xNrUNeoRftJgLw==
Received: from SRVEX01-SZ.bfs.intern (10.129.90.31) by SRVEX01-SZ.bfs.intern
 (10.129.90.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2; Fri, 30 Oct
 2020 15:40:16 +0100
Received: from SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a]) by
 SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a%6]) with mapi id
 15.01.2106.002; Fri, 30 Oct 2020 15:40:16 +0100
From:   Walter Harms <wharms@bfs.de>
To:     Colin King <colin.king@canonical.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH][next] SFH: fix error return check for -ERESTARTSYS
Thread-Topic: [PATCH][next] SFH: fix error return check for -ERESTARTSYS
Thread-Index: AQHWrskuXLpwIZymK0ijx6Rejl2IgqmwNwWH
Date:   Fri, 30 Oct 2020 14:40:16 +0000
Message-ID: <7f7ed9ecdd05422ab83e0c08918063bc@bfs.de>
References: <20201030143002.535531-1-colin.king@canonical.com>
In-Reply-To: <20201030143002.535531-1-colin.king@canonical.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.137.16.40]
x-tm-as-product-ver: SMEX-14.0.0.3031-8.6.1012-25754.007
x-tm-as-result: No-10--2.352600-5.000000
x-tmase-matchedrid: mvluSfSKbybed0Ij9t5iQyEyJ8xFEVolPknazlXMVpV+SLLtNOiBhrLs
        vs6J0rHdn7u/QIiCqWwtbPbgNcDnUHsC/8Evf2rHuLHENGl+3A8s+CgjlNydnK3DfQXYDXXmRiM
        0r5DoZkAaKUs5KpcJNCpx2wcbM9GceJsRTRVp6OeBgUO0zfAYGiYof8qPjr5Vr3DiW2de5g9WL1
        ppT+hcnkrdOgydR3zuSRrr9O/+ItA4qGaEI/i7xj8Ckw9b/GFeTJDl9FKHbrlVZCccrGnfyE7Mp
        Biz7lGO2FGkLR/Vo15CRcUvq6BHE+q4eBfl/7E8ngIgpj8eDcByZ8zcONpAscRB0bsfrpPInxMy
        eYT53RmeE9fZ+hq24B951RXwyVmMgCFeXgdqtNDboEDzCkGr8rttoi14YodtmWT8ZL8Jd0nDAOD
        iwfECzWgr//OP2OLmwgNrDDOh+Ifn97Tpk1RUclMrCGEFu0pWavaGrHEVCAk0gJueLVvpvFZca9
        RSYo/b
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--2.352600-5.000000
x-tmase-version: SMEX-14.0.0.3031-8.6.1012-25754.007
x-tm-snts-smtp: 444385313A455BFB87A92C665C16806337DE81BD868772F9F1F807BDB9CCB3422000:9
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=-2.42
Authentication-Results: mx01-sz.bfs.de;
        none
X-Spamd-Result: default: False [-2.42 / 7.00];
         ARC_NA(0.00)[];
         TO_DN_EQ_ADDR_SOME(0.00)[];
         HAS_XOIP(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         DKIM_SIGNED(0.00)[];
         RCPT_COUNT_SEVEN(0.00)[8];
         NEURAL_HAM(-0.00)[-0.926];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-2.42)[97.34%]
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

nit picking:
i would  without "else" to improve readability:

       if (ret =3D=3D -ERESTARTSYS)
                 return -ERESTARTSYS;

        if (ret < 0)
              return -ETIMEDOUT;

          return 0;

jm2c
 wh
________________________________________
Von: Colin King <colin.king@canonical.com>
Gesendet: Freitag, 30. Oktober 2020 15:30:02
An: Nehal Shah; Sandeep Singh; Jiri Kosina; Benjamin Tissoires; linux-input=
@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Betreff: [PATCH][next] SFH: fix error return check for -ERESTARTSYS

From: Colin Ian King <colin.king@canonical.com>

Currently the check for the error return code -ERESTARTSYS is dead code
and never executed because a previous check for ret < 0 is catching this
and returning -ETIMEDOUT instead.  Fix this by checking for -ERESTARTSYS
before the more generic negative error code.

Addresses-Coverity: ("Logically dead code")
Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fus=
ion Hub (SFH)")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_hid.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c b/drivers/hid/amd-sfh-hi=
d/amd_sfh_hid.c
index a471079a3bd0..4f989483aa03 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
@@ -88,10 +88,10 @@ static int amdtp_wait_for_response(struct hid_device *h=
id)
                ret =3D wait_event_interruptible_timeout(hid_data->hid_wait=
,
                                                       cli_data->request_do=
ne[i],
                                                       msecs_to_jiffies(AMD=
_SFH_RESPONSE_TIMEOUT));
-       if (ret < 0)
-               return -ETIMEDOUT;
-       else if (ret =3D=3D -ERESTARTSYS)
+       if (ret =3D=3D -ERESTARTSYS)
                return -ERESTARTSYS;
+       else if (ret < 0)
+               return -ETIMEDOUT;
        else
                return 0;
 }
--
2.27.0

