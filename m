Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39D57139107
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2020 13:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgAMM1Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 07:27:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:43868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725832AbgAMM1Q (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 07:27:16 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D58002084D;
        Mon, 13 Jan 2020 12:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578918435;
        bh=MFEPfdA+QsEVeUYS3nDx77LbmgiN2tk3SkvZyVQ4qII=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=hcvfvV+T3tJ4URMj1PE3ed49mkd7Sg3fyhShjEZFDPfg6xwZpkA/XL9vZq5Koyz3p
         ezaDqG+/zlwhK+mgp7LD+ZVohdP+Q6d+ijrGgyWn9SiFy++P5nzHg0j+jD5u1Zm2n/
         JC/9epXhXbvmNBYZxQc89MqeA/9OLoqcf38otedQ=
Date:   Mon, 13 Jan 2020 13:27:12 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: avoid duplicate error handling code
 in 'hidpp_probe()'
In-Reply-To: <20191226145435.8262-1-christophe.jaillet@wanadoo.fr>
Message-ID: <nycvar.YFH.7.76.2001131327020.31058@cbobk.fhfr.pm>
References: <20191226145435.8262-1-christophe.jaillet@wanadoo.fr>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 26 Dec 2019, Christophe JAILLET wrote:

> 'hid_hw_stop()' is already in the error handling path when branching to
> the 'hid_hw_open_fail' label.
> There is no point in calling it twice, so remove one.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index bb063e7d48df..70e1cb928bf0 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -3817,7 +3817,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	if (ret < 0) {
>  		dev_err(&hdev->dev, "%s:hid_hw_open returned error:%d\n",
>  			__func__, ret);
> -		hid_hw_stop(hdev);
>  		goto hid_hw_open_fail;

Thanks for catching this. Applied now.

-- 
Jiri Kosina
SUSE Labs

