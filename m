Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5463F32F038
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 17:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbhCEQlx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Mar 2021 11:41:53 -0500
Received: from 10.mo178.mail-out.ovh.net ([46.105.76.150]:39631 "EHLO
        10.mo178.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhCEQlu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Mar 2021 11:41:50 -0500
X-Greylist: delayed 16793 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Mar 2021 11:41:50 EST
Received: from player691.ha.ovh.net (unknown [10.108.54.133])
        by mo178.mail-out.ovh.net (Postfix) with ESMTP id 43F9BC6FDC
        for <linux-input@vger.kernel.org>; Fri,  5 Mar 2021 12:55:57 +0100 (CET)
Received: from etezian.org (213-243-141-64.bb.dnainternet.fi [213.243.141.64])
        (Authenticated sender: andi@etezian.org)
        by player691.ha.ovh.net (Postfix) with ESMTPSA id 1E23A1BCE06D7;
        Fri,  5 Mar 2021 11:55:50 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-104R0055e4a7d2d-f7ba-4b7b-8661-49069e8a18d8,
                    8BB957472A3FEC517196918F6D0E8FFF2983C800) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 213.243.141.64
Date:   Fri, 5 Mar 2021 13:55:48 +0200
From:   Andi Shyti <andi@etezian.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Andi Shyti <andi@etezian.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: s6sy761: fix coordinate read bit shift
Message-ID: <YEIcRBjVSrAIaB+c@jack.zhora.eu>
References: <20210305020310.550527-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305020310.550527-1-caleb@connolly.tech>
X-Ovh-Tracer-Id: 2039286209993949911
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihesvghtvgiiihgrnhdrohhrgheqnecuggftrfgrthhtvghrnheptdfgudduhfefueeujeefieehtdeftefggeevhefgueellefhudetgeeikeduieefnecukfhppedtrddtrddtrddtpddvudefrddvgeefrddugedurdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Caleb,

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256

Please clean up the commit message.

> The touch coordinates are read by shifting a value left by 3,
> this is incorrect and effectively causes the coordinates to
> be half of the correct value.
> 
> Shift by 4 bits instead to report the correct value.
> 
> This matches downstream examples, and has been confirmed on my
> device (OnePlus 7 Pro).

The real reason is that from the register we get:

       byte 3             byte 2             byte 1
+--------+--------+ +-----------------+ +-----------------+
|        |        | |                 | |                 |
| X[3:0] | Y[3:0] | |     Y[11:4]     | |     X[11:4]     |
|        |        | |                 | |                 |
+--------+--------+ +-----------------+ +-----------------+

and the 12 bit values have to fit in a 16bit variable.

The upper 8 bits (in event[2] and event[1] need to be shifted
left by '4' and not by '3' in order to leave space to the lower
4 bits (in event[3]).

> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  drivers/input/touchscreen/s6sy761.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/s6sy761.c b/drivers/input/touchscreen/s6sy761.c
> index b63d7fdf0cd2..85a1f465c097 100644
> --- a/drivers/input/touchscreen/s6sy761.c
> +++ b/drivers/input/touchscreen/s6sy761.c
> @@ -145,8 +145,8 @@ static void s6sy761_report_coordinates(struct s6sy761_data *sdata,
>  	u8 major = event[4];
>  	u8 minor = event[5];
>  	u8 z = event[6] & S6SY761_MASK_Z;
> -	u16 x = (event[1] << 3) | ((event[3] & S6SY761_MASK_X) >> 4);
> -	u16 y = (event[2] << 3) | (event[3] & S6SY761_MASK_Y);
> +	u16 x = (event[1] << 4) | ((event[3] & S6SY761_MASK_X) >> 4);
> +	u16 y = (event[2] << 4) | (event[3] & S6SY761_MASK_Y);

the devil knows how that '3' has ended up there :)

Thanks for catching it!

Reviewed-by: Andi Shyti <andi@etezian.org>

Andi
