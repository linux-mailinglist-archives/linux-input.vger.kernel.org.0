Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFEFCFA86
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2019 14:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730317AbfJHMzW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Oct 2019 08:55:22 -0400
Received: from 1.mo4.mail-out.ovh.net ([178.33.248.196]:54380 "EHLO
        1.mo4.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730316AbfJHMzW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Oct 2019 08:55:22 -0400
X-Greylist: delayed 4796 seconds by postgrey-1.27 at vger.kernel.org; Tue, 08 Oct 2019 08:55:22 EDT
Received: from player168.ha.ovh.net (unknown [10.109.160.244])
        by mo4.mail-out.ovh.net (Postfix) with ESMTP id D3D8320841E
        for <linux-input@vger.kernel.org>; Tue,  8 Oct 2019 13:35:24 +0200 (CEST)
Received: from etezian.org (85-76-98-218-nat.elisa-mobile.fi [85.76.98.218])
        (Authenticated sender: andi@etezian.org)
        by player168.ha.ovh.net (Postfix) with ESMTPSA id C8BA2A9AD333;
        Tue,  8 Oct 2019 11:35:13 +0000 (UTC)
Date:   Tue, 8 Oct 2019 14:35:11 +0300
From:   Andi Shyti <andi@etezian.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi@etezian.org>,
        Simon Shields <simon@lineageos.org>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: mms114 - add support for mms345l
Message-ID: <20191008113511.GA4015@jack.zhora.eu>
References: <20191007203343.101466-1-stephan@gerhold.net>
 <20191007205021.104402-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007205021.104402-1-stephan@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Ovh-Tracer-Id: 8393583808645546733
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrheelgdeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Stephan,

On Mon, Oct 07, 2019 at 10:50:21PM +0200, Stephan Gerhold wrote:
> MMS345L is another first generation touch screen from Melfas,
> which uses the same registers as MMS152.
> 
> However, using I2C_M_NOSTART for it causes errors when reading:
> 
> 	i2c i2c-0: sendbytes: NAK bailout.
> 	mms114 0-0048: __mms114_read_reg: i2c transfer failed (-5)
> 
> The driver works fine as soon as I2C_M_NOSTART is removed.
> 
> Add a separate melfas,mms345l binding, and make use of I2C_M_NOSTART
> only for MMS114 and MMS152.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Andi Shyti <andi@etezian.org>

just a nitpick in case you will resend it (but you don't need
to).

> -	if (!i2c_check_functionality(client->adapter,
> -				I2C_FUNC_PROTOCOL_MANGLING)) {
> +	type = (enum mms_type)device_get_match_data(&client->dev);

you don't need any cast here.

Thanks,
Andi
