Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F308631213A
	for <lists+linux-input@lfdr.de>; Sun,  7 Feb 2021 05:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhBGEPx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Feb 2021 23:15:53 -0500
Received: from beige.elm.relay.mailchannels.net ([23.83.212.16]:16188 "EHLO
        beige.elm.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229570AbhBGEPx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 6 Feb 2021 23:15:53 -0500
X-Greylist: delayed 1431 seconds by postgrey-1.27 at vger.kernel.org; Sat, 06 Feb 2021 23:15:53 EST
X-Sender-Id: hostingeremail|x-authsender|colton@boothsoftware.ca
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 4D5289220B9;
        Sun,  7 Feb 2021 03:51:15 +0000 (UTC)
Received: from nl-srv-smtpout2.hostinger.io (100-96-10-13.trex.outbound.svc.cluster.local [100.96.10.13])
        (Authenticated sender: hostingeremail)
        by relay.mailchannels.net (Postfix) with ESMTPA id 673A09216BC;
        Sun,  7 Feb 2021 03:51:12 +0000 (UTC)
X-Sender-Id: hostingeremail|x-authsender|colton@boothsoftware.ca
Received: from nl-srv-smtpout2.hostinger.io ([UNAVAILABLE]. [145.14.159.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
        by 100.96.10.13 (trex/6.0.2);
        Sun, 07 Feb 2021 03:51:15 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authsender|colton@boothsoftware.ca
X-MailChannels-Auth-Id: hostingeremail
X-Descriptive-Robust: 0eb94da46eac812e_1612669875081_422781994
X-MC-Loop-Signature: 1612669875081:1780897850
X-MC-Ingress-Time: 1612669875080
Received: from localhost.localdomain (unknown [IPv6:2607:fea8:a75f:aa80:1cb5:f870:745:692d])
        (Authenticated sender: colton@boothsoftware.ca)
        by nl-srv-smtpout2.hostinger.io (smtp.hostinger.com) with ESMTPSA id 57E0B333EFAF;
        Sun,  7 Feb 2021 03:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=boothsoftware.ca;
        s=hostingermail-a; t=1612669870;
        bh=pYnuhkPXjsLWofrVCnC38U/IKzqhlzj4udvOa6QX/dM=;
        h=From:To:Cc:Subject:Date;
        b=oTEP+zuHnLckdhVGrVDmfnCwk+s6ZeF0khxWGyCETuluwYfn3otXoy54ScaHUxp/E
         ueUU82lU5nFTWTx8cYbnpvC8FlHVJEkgmbw2PQSrqs4nCEusSj0DDoAg/kue9dAq2r
         U9obo5J5dDiEjuSFlj1EaS97WuWWFvuLzHWRUEDwkP9Za1GhM90uyopR0Ff8uDOK/a
         rakD2hekK9rB+Z99GJ1mp10k2+WqW6z0/2QOCZWg4gZi/n1zLLGZTqp/BKhozzY/X6
         J4h4FJVPKlLTcNZH23sW0QE4+4QHA8uZsWvY3QXQfg0/RfIBCuuREPFQQEm1seIC5l
         q9ubh8y5gAJfA==
From:   Colton Booth <colton@boothsoftware.ca>
To:     dmitry.torokhov@gmail.com
Cc:     colton@boothlinux.ca, Colton Booth <colton@boothsoftware.ca>,
        Lyude Paul <lyude@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Lee Jones <lee.jones@linaro.org>,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Dennis Kadioglu <denk@eclipso.email>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Yussuf Khalil <dev@pp3345.net>, Ilya Katsnelson <me@0upti.me>,
        Gaurav Agrawal <agrawalgaurav@gnome.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: synaptic - reverting dcb00fc799dc03fd320e123e4c81b3278c763ea5 because it breaks the touchpad for one guy on Reddit.
Date:   Sat,  6 Feb 2021 22:50:21 -0500
Message-Id: <20210207035024.69095-1-colton@boothsoftware.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I can't test myself since I don't have the correct hardware, BUT this change seems to work for him. I'm thinking he has an early version of the X1E which may use slightly different trackpad revision.

Signed-off-by: Colton Booth <colton@boothsoftware.ca>
---
 drivers/input/mouse/synaptics.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index ffad142801b3..2d3f03921dbc 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -179,9 +179,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN0093", /* T480 */
 	"LEN0096", /* X280 */
 	"LEN0097", /* X280 -> ALPS trackpoint */
-	"LEN0099", /* X1 Extreme Gen 1 / P1 Gen 1 */
 	"LEN009b", /* T580 */
-	"LEN0402", /* X1 Extreme Gen 2 / P1 Gen 2 */
 	"LEN200f", /* T450s */
 	"LEN2044", /* L470  */
 	"LEN2054", /* E480 */
-- 
2.24.3 (Apple Git-128)

