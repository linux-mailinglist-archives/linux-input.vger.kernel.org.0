Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01BB4182753
	for <lists+linux-input@lfdr.de>; Thu, 12 Mar 2020 04:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387658AbgCLDOd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Mar 2020 23:14:33 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:39593 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387453AbgCLDOc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Mar 2020 23:14:32 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 30DA28BB;
        Wed, 11 Mar 2020 23:14:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Wed, 11 Mar 2020 23:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=xGzQ7xg6V2hzCeYDub4RmkUI42g
        VfxcqitmM4leDLF0=; b=bKW0JsLci/UuxZ8NG9T7lPpuouSF/34YF7Yfd5ilSsV
        gci44yDu+Npb6ka+qY88kNSDzEFDUpGveWwjd9SpK6lwhgtCSMUL85Zt0dgrUtTa
        CjvJbsOvQBq8DlppW+C/iHTMtssKsbEwzWvFl5wR/0aZDONjlXI7MuH15Vp1mFaL
        P6UJNv+O8Gxtku3aDXU8lIE5XCMMDbkOczNvGJUQBaBsirqfnnOiRtS+8w7gG541
        HXjg6ZIERlo4b0EMZ0wfXdhiwMWMWXoPUMN+X6i622oNkU+YfUFzMxGnsd/ysZWK
        q4EVFA+pkDjgLXSXUVuX9Srl0GPTgT56WzR7TZC+fKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xGzQ7x
        g6V2hzCeYDub4RmkUI42gVfxcqitmM4leDLF0=; b=p8Aa5YdWGRhi+9UBpt1Hmn
        VzH5XIxjvcBdXEXDvNjWF1veIXqW6TwyVqvBQNAJZ9+9J5EKlZHup6TVB/G4xLFx
        1xYaIW8z4GtDv415xvLhGuVsAAgH9aATGHzhGQD10B2jA0j5rzY/KhtAjyzXnaco
        a0e6xk/pX7a2bDbFXcgG1jw5eji+CbvxsWy/nCgMJJbGlIMMWGmwf491zyoge/U6
        ioF8oYx1h2Merc+/wK9PYiRx79INf2RYdc3B8gfZ3LIMLb+o3r0gMtiuUUu7iItN
        5C1zhglmDcUypQ6dK/PxUKuMOoCu2Rt5ie0wWTuOMaqWbGiHfDYC48rlYjHvBZ3w
        ==
X-ME-Sender: <xms:FalpXliC84yMbBozwweHQ5DU_tGI5CgiWjwIei9ybMQFCXFlN9ML8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddvgedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeduudejrddv
    tddrjedurddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:FalpXvKDSF5Vq22QhiYb8IKRsaMUJ_l7NM08kJbrEJEJ0E-oFQ2zVw>
    <xmx:FalpXoBxVUcpkMgb15CExhXefQ8flS_eh0ne-kkLmnMy_77MynyucA>
    <xmx:FalpXgScpvjGWkQ2llPBEfoDnC9tjikMD5Y96ClFg_O8CHriVynKLQ>
    <xmx:FqlpXqiSD1BuajlLZNQNNWO0imwLEVK_1wFHkyDHfgr29QnZZCoBDQ>
Received: from jelly (117-20-71-109.751447.bne.nbn.aussiebb.net [117.20.71.109])
        by mail.messagingengine.com (Postfix) with ESMTPA id 24ACE30611FB;
        Wed, 11 Mar 2020 23:14:26 -0400 (EDT)
Date:   Thu, 12 Mar 2020 13:14:22 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Andrew Duggan <aduggan@synaptics.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Paul Hollinsky <phollinsky@holtechnik.com>,
        Christopher Heiny <Cheiny@synaptics.com>,
        Lucas Stach <l.stach@pengutronix.de>, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH] Input: synaptics-rmi4 - Do not set reduced reporting
 mode thresholds are not set by the driver
Message-ID: <20200312031422.GA1823643@jelly>
References: <20200312005549.29922-1-aduggan@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312005549.29922-1-aduggan@synaptics.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andrew,

On Wed, Mar 11, 2020 at 05:55:49PM -0700, Andrew Duggan wrote:
> The previous patch "c5ccf2ad3d33 (Input: synaptics-rmi4 - switch to
> reduced reporting mode)" enabled reduced reporting mode unintentionally
> on some devices, if the firmware was configured with default Delta X/Y
> threshold values. The result unintentionally degrade the performance of
> some touchpads.

could this be the cause of a stuttering cursor on a P50 as well?
A recording in the issue below shows the cursor moving by ~25 units per
event, regardless of the time between those events.
https://gitlab.freedesktop.org/libinput/libinput/issues/448

thanks!

Cheers,
   Peter

> This patch checks to see that the driver is modifying the delta X/Y
> thresholds before modifying the reporting mode.
> 
> Signed-off-by: Andrew Duggan <aduggan@synaptics.com>
> ---
>  drivers/input/rmi4/rmi_f11.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/rmi4/rmi_f11.c b/drivers/input/rmi4/rmi_f11.c
> index 6adea8a3e8fb..ffa39ab153f2 100644
> --- a/drivers/input/rmi4/rmi_f11.c
> +++ b/drivers/input/rmi4/rmi_f11.c
> @@ -1203,8 +1203,8 @@ static int rmi_f11_initialize(struct rmi_function *fn)
>  	 * If distance threshold values are set, switch to reduced reporting
>  	 * mode so they actually get used by the controller.
>  	 */
> -	if (ctrl->ctrl0_11[RMI_F11_DELTA_X_THRESHOLD] ||
> -	    ctrl->ctrl0_11[RMI_F11_DELTA_Y_THRESHOLD]) {
> +	if (sensor->axis_align.delta_x_threshold ||
> +	    sensor->axis_align.delta_y_threshold) {
>  		ctrl->ctrl0_11[0] &= ~RMI_F11_REPORT_MODE_MASK;
>  		ctrl->ctrl0_11[0] |= RMI_F11_REPORT_MODE_REDUCED;
>  	}
> -- 
> 2.20.1
> 
