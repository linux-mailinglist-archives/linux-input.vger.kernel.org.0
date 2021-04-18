Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4857236345C
	for <lists+linux-input@lfdr.de>; Sun, 18 Apr 2021 10:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhDRIs7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 18 Apr 2021 04:48:59 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:59185 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229790AbhDRIs7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 18 Apr 2021 04:48:59 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 6BEA15C064E;
        Sun, 18 Apr 2021 04:48:31 -0400 (EDT)
Received: from imap4 ([10.202.2.54])
  by compute4.internal (MEProxy); Sun, 18 Apr 2021 04:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YPv0HS
        BI+jZvYE3AHbx8Yb+XJqpQknmCCaI7sLWAgNU=; b=GKaNDewjx0D+bsgCRZlero
        o20jtUsA81tmu0DQXA9KPYW3ZDfwVhAt8Xg87+UNROgVPOJgM9TLPGjidg+OZuR2
        Ka/WOBfoLEWX1GqDkZUpvCra4XCHNyt7KvngADBEO8ViGcu7DH3gC/qFshp7QrBJ
        jLapaDYM27vinq0xePVHjqtK4+qNd8+t8e0T0xiahWKQlhn0Dti10joCyQ3UfnDs
        WfcEtvjJ4RobpX7CCamvMpkla8oSFG5i2o9rE/by+AAuVfpMBNevglo2rvY4Brhc
        sdncQGgpKsa8DVuGxBslyH+qRylu7CZDDZ+0snTBHK2TsPxv7pQ1hE1MKB6vJyew
        ==
X-ME-Sender: <xms:XvJ7YCe2wKYWitvrTzmfxb85zA9QQfWqlTmE7oMCVA0eMVWMPgTw5w>
    <xme:XvJ7YMO0nin-S7NWYlGCDVVb2dbr-ALOVTfw7YUm3E9A0F_sc5Sa0SPcWbkjGx9en
    G6nPli0-4MbxOQMZug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelkedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhn
    vghsrdguvghvqeenucggtffrrghtthgvrhhnpedugedvhfelheejhfekvdeuudekfeefle
    dtueegvddtteffheevjedukeejleevtdenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:XvJ7YDiBHgRblSzc5ictPphxkohzFO5slPCr8oy2ogksWTaQTdO8Sw>
    <xmx:XvJ7YP_AmB3dzt2ufCuUmybt8xa13hFYFv6LshH0WF06GQYLEka6oQ>
    <xmx:XvJ7YOsKxyAybaFOe_ktvuPqi3EZAJEumsNgAKCdG5hjTAdrcZ47mA>
    <xmx:X_J7YE2NlRcG6h6obzrjdcbK40B8GoZQ3lhPVYnN1mRUIMFYoSwtow>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C316B16006B; Sun, 18 Apr 2021 04:48:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <8e7bc47b-03f8-4edd-bb3b-ed67951ff351@www.fastmail.com>
In-Reply-To: <20210218213846.22504-1-luke@ljones.dev>
References: <20210218213846.22504-1-luke@ljones.dev>
Date:   Sun, 18 Apr 2021 20:48:10 +1200
From:   "Luke Jones" <luke@ljones.dev>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: asus: Filter keyboard EC for old ROG keyboard
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all,

Can I get a status on this patch please? I've not had feedback.
I can verify that the same changed in a dkms module used by
hundreds of others is working quite well.

Cheers,
Luke

On Fri, 19 Feb 2021, at 10:38 AM, Luke D Jones wrote:
> Older ROG keyboards emit a similar stream of bytes to the new
> N-Key keyboards and require filtering to prevent a lot of
> unmapped key warnings showing. As all the ROG keyboards use
> QUIRK_USE_KBD_BACKLIGHT this is now used to branch to filtering
> in asus_raw_event.
> 
> Signed-off-by: Luke D Jones <luke@ljones.dev <mailto:luke%40ljones.dev>>
> ---
> drivers/hid/hid-asus.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 2ab22b925941..1ed1c05c3d54 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -335,7 +335,7 @@ static int asus_raw_event(struct hid_device *hdev,
> if (drvdata->quirks & QUIRK_MEDION_E1239T)
> return asus_e1239t_event(drvdata, data, size);
>  
> - if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> + if (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) {
> /*
> * Skip these report ID, the device emits a continuous stream associated
> * with the AURA mode it is in which looks like an 'echo'.
> -- 
> 2.30.1
> 
> 
