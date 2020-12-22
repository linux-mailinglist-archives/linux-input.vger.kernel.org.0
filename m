Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF812E0E2E
	for <lists+linux-input@lfdr.de>; Tue, 22 Dec 2020 19:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgLVSUz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Dec 2020 13:20:55 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:37901 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725300AbgLVSUy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Dec 2020 13:20:54 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 8E7BE5C013A;
        Tue, 22 Dec 2020 13:20:08 -0500 (EST)
Received: from imap9 ([10.202.2.59])
  by compute2.internal (MEProxy); Tue, 22 Dec 2020 13:20:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm1; bh=VTW0H4Qe6Fi8BWBDKiPWF0gaJV0ssh8M8JpxCNLkTiY=; b=j6f9Zde7
        ka3bdZ7R8yFqzSFAHHZg+K8gbe3OSmUW04vIW2CevclrBe9+1WnbizhqW87ZcTrH
        Yu2491PVg4mTedWIH1pv6LWMe5545SKgy13hHVHRSIvtwguaza9Y6DG876gz9LHN
        KqiHxTa4Y7hWHzS/gZnMg7U/CA3a7XxG9PH98JRH6+6JnsS8AB70+iejqiPhDZEx
        oJsDssFLs2SxvNy8FU7yspslIMUNvWaMtoJapArZBx6VfgDTTya7XvRgrnyirMCv
        t3xD/KivV4qPicz70YXn85d528R/DYTodfF3wpXkhD1oDu+AiSyBKlmhLQc4ka7N
        /h5lrAOv/1Op6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=VTW0H4Qe6Fi8BWBDKiPWF0gaJV0ss
        h8M8JpxCNLkTiY=; b=Fn3U1032WcnIJvxwTQrm7eK0z38G8ZCLIC1eVm1YqYoZJ
        1KkTjDx5QW8r8cVUI0ZMIWc9HqJIXFa8QZK3Gna3vr1tDmDX5C/gzoZtZlAHQ3WS
        zDBQDXfScKuHDzYeV/y7cLAxBXq/Vas4yQS/SCy5PL730h/NfwVeg7NQmzc8GmAr
        zTMrqIlUb0rlyQzDJHIik87jEBgauacrIX6akTKs4NLDMOoomu0SmEoSiym+O2+K
        hAHMJib2qnxqrwsAUApexHG51d5614n5t2k36WHr1gdOytPGm4pOyBrTc2aBgOWk
        2yky0Nzs78j2PZSBelOtnurkxJzys1IFx+esfqnhw==
X-ME-Sender: <xms:2DjiX1tmjb0Nv6no4umG_I_nV8BvPKVuycCrldV5WN-YyQ398ViMeg>
    <xme:2DjiX-dyBE1rYa3YLVZBtXypHxQXOVDOiLGU30GAuYUPdptssLD-f9iTbqdLvqS5J
    Rr0Xwi015ivNhehcNk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtgedguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfffhffvufgtsehttdertderreejnecuhfhrohhmpedfjhhushht
    ihhnucgsuhhssgihfdcuoehjsgdrkhgvrhhnvghlsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepjefhjefhieejvdfgjeekudejjefhteektdehvdejjeelieei
    jefhgefhvefgieeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsgdrkhgvrhhnvghlsehf
    rghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:2DjiX4zOdADqyK53rj_z4B6A_wUIOLuFJri8wO4efj8N2gFdnCuZRw>
    <xmx:2DjiX8MlQTmoPHaiiJi3Juxe38wS-uIQjta5BxPEmj8NcAH7eHDf3w>
    <xmx:2DjiX18Ksg4Ae3UNelK6vratQOCQQRXdj6guq4tYrPP0CSIT8czgJA>
    <xmx:2DjiX6J7FzUrf-EoQnn4PSaPnsUgfIZwxFKmjQdkgt8G6toeysZwsQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 640AF1C00F9; Tue, 22 Dec 2020 13:20:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <1e2e981b-05af-43a7-bdfe-424d8783d28f@www.fastmail.com>
Date:   Tue, 22 Dec 2020 18:19:48 +0000
From:   "justin busby" <jb.kernel@fastmail.com>
To:     "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: =?UTF-8?Q?[PATCH]_Fix_two_finger_scroll_which_stops_working_on_synaptics?=
 =?UTF-8?Q?_touchpad_after_resume?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

Bug reported here: https://bugzilla.kernel.org/show_bug.cgi?id=196719 

Reliably reproduceable on my Lenovo T540p.

It looks like the this was introduced between the fast reconnect and smbus companion work in 0ab3fa57425023f42e8822a293d9b87a3ad4e2b3 ( Input: psmouse - implement fast reconnect option) and 8eb92e5c91338eb19f86ffb2232258337ebf905b (Input: psmouse - add support for SMBus companions) respectively meaning that fast_reconnect is called psmouse-smbus.c rather reconnect in synaptics.c. This is because synaptics.c doesn't set up fast_reconnect in the struct so it's left as the one added by the smbus companion code.

Set the fast_reconnect function pointer to the reconnect function in synaptics.c.

Kind Regards,
Justin.

--- /home/justin/development/linux/drivers/input/mouse/synaptics.c.orig	2020-12-22 17:35:47.194989017 +0000
+++ /home/justin/development/linux/drivers/input/mouse/synaptics.c	2020-12-22 17:36:09.863354144 +0000
@@ -1619,6 +1619,7 @@ static int synaptics_init_ps2(struct psm
 	psmouse->set_rate = synaptics_set_rate;
 	psmouse->disconnect = synaptics_disconnect;
 	psmouse->reconnect = synaptics_reconnect;
+	psmouse->fast_reconnect = synaptics_reconnect;
 	psmouse->cleanup = synaptics_reset;
 	/* Synaptics can usually stay in sync without extra help */
 	psmouse->resync_time = 0;

Signed-off-by: Justin Busby <jb.kernel@fastmail.com>
