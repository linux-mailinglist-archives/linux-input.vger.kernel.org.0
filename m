Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5EE6A3575
	for <lists+linux-input@lfdr.de>; Mon, 27 Feb 2023 00:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjBZXCU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Feb 2023 18:02:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjBZXCT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Feb 2023 18:02:19 -0500
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5462D3C07
        for <linux-input@vger.kernel.org>; Sun, 26 Feb 2023 15:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677452506; x=1708988506;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J9Xh3CSLaOh0wPb+8qljSocu9qIOGDzuCRuMHEY8zLA=;
  b=UzvLuJxChq++RB69I1AK16+iU+r25o9EonzVue3oHcDczXkiJ6RbtZ5Y
   p+3Yhg+XYoJIREqCqW0E7NwKCGjXs7cmRj/BAP17jCMkAivZC7otrOCkp
   mdULLa3dn8NPlpr3n97Xe1lviO0od4f5iDbC+9ZY3ZHgn0+FEmVY/GI8U
   G7nxbmQgUPjD6bOttiBSrIYKnhoCahERj1Mmr+2CCTaoiCocju+cvitb0
   hKFbbPmFH1HeBPW4feILi/8zF2mEEqR0c5iYDHujqBzxucEWQVzG0uO7U
   8EMmKBWVcJrijVbByuUVIJsl8PH2iiURSt1ahPV+UBxoI3q/2fnYWcGOI
   g==;
X-IronPort-AV: E=Sophos;i="5.97,330,1669046400"; 
   d="scan'208";a="222554293"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 27 Feb 2023 06:59:15 +0800
IronPort-SDR: 3iAOSD5s+GQJ4aHsofo16WziIDS5n6+2GlVepX2+bHTSloW90zYpJfusrwVHzlq0L7ud1Z5/4T
 uc+nGFqCJ5til1kD3d7+EgKkEYbP0tD5nzixxiFnGTqQHCrIIjdRvilqptVivoseAm3WWgnB4J
 LzO7q+7oRgYVT/COZAmBasgyUWXILTSHIYjQwUIfNycVP7XE6YqZp3OgA8QKijjvUpW5OfAy5o
 HDLwjRngeEoKsBYeG10jkvfoAs86x7dHpQogtXh0jX+n332F94g1aoVkCbJravooASnwosVIVF
 nts=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Feb 2023 14:10:24 -0800
IronPort-SDR: RkCRN09axqIfMm1MuDWW1zfJJ0eBQl64qnUmDph7ppV5R2g1gYUZoLVYVP7H9mIV16pSpC+Leg
 zkjxyd94zWUpfXTLh9gF3/ZxugDVjRJGfmNkG5KMfox/NTUuzkxZ8e714Ei2B1e3XWv1Ala1Qq
 7inB4MuFIPAgBWq5o8/SSqBNgxw4cGUt2rZB6FeJYth3zofq1R+A82P64xZAEdGM1zCyT4CDQL
 VNdruznPAkx8pfmR1XxHDatdR+apMGlBSDfgADEtk1ItmhzNSjYltbMWsQqm5ETM59Jo1h5Sbz
 Kjg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Feb 2023 14:59:16 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PPzb73Wksz1Rwtl
        for <linux-input@vger.kernel.org>; Sun, 26 Feb 2023 14:59:15 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1677452354; x=1680044355; bh=J9Xh3CSLaOh0wPb+8qljSocu9qIOGDzuCRu
        MHEY8zLA=; b=iAFv7gkoa1pp+0xeoFxAdTchRJcF7b5UmjXwypMYYaMEb+gXnhh
        i+xBLhRs7ybC6NKcaFw1srFUizSpMJeDj3DQb3u52D15SERUpb3qogMC05ahSV0Y
        Rfu9IKYjLO8ZUjHo834CD/sYRhYEslbVwDIEgc2ZmU1mFVQU7vxDbCob9DXmC60R
        A78dZnTzDMksnw3bnTzp+W8BcBYl0KqZEcYY13QB5+bS3Z0Bt7BmxsEweV82kybH
        cIMGUln2jO0hFnxaRlIQBZpOOvSZTLpgd3fHkasBzpalSwtP1irBSCNzj1UrwHzU
        e2IJ7N7AouJmgR9knygZsoS8VFPenj4hDWw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id WW_OS2z4u0Uw for <linux-input@vger.kernel.org>;
        Sun, 26 Feb 2023 14:59:14 -0800 (PST)
Received: from [10.225.163.40] (unknown [10.225.163.40])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PPzZz6V4Rz1RvLy;
        Sun, 26 Feb 2023 14:59:07 -0800 (PST)
Message-ID: <fc0adb2c-8be0-ec89-ba68-032862b700a9@opensource.wdc.com>
Date:   Mon, 27 Feb 2023 07:59:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 04/20] thermal/core: Use the thermal zone 'devdata'
 accessor in remaining drivers
Content-Language: en-US
To:     Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Ido Schimmel <idosch@nvidia.com>,
        Gregory Greenman <gregory.greenman@intel.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Raju Rangoju <rajur@chelsio.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Petr Machata <petrm@nvidia.com>, Kalle Valo <kvalo@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "open list:ACPI THERMAL DRIVER" <linux-acpi@vger.kernel.org>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
        "open list:ARM/Allwinner sunXi SoC support" 
        <linux-sunxi@lists.linux.dev>,
        "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." 
        <linux-input@vger.kernel.org>,
        "open list:CXGB4 ETHERNET DRIVER (CXGB4)" <netdev@vger.kernel.org>,
        "open list:INTEL WIRELESS WIFI LINK (iwlwifi)" 
        <linux-wireless@vger.kernel.org>
References: <20230226225406.979703-1-daniel.lezcano@linaro.org>
 <20230226225406.979703-5-daniel.lezcano@linaro.org>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230226225406.979703-5-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2/27/23 07:53, Daniel Lezcano wrote:
> The thermal zone device structure is exposed to the different drivers
> and obviously they access the internals while that should be
> restricted to the core thermal code.
> 
> In order to self-encapsulate the thermal core code, we need to prevent
> the drivers accessing directly the thermal zone structure and provide
> accessor functions to deal with.
> 
> Use the devdata accessor introduced in the previous patch.
> 
> No functional changes intended.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com> #mlxsw
> Acked-by: Gregory Greenman <gregory.greenman@intel.com> #iwlwifi
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> #power_supply
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

For the ahci change:

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

