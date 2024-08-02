Return-Path: <linux-input+bounces-5282-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 181E5945C65
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 12:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCA2A281B20
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 10:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1887A1DD3A3;
	Fri,  2 Aug 2024 10:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4/tgcIt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E176A1DC461;
	Fri,  2 Aug 2024 10:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722595722; cv=none; b=tW/RX/kYu7MkGMLZ4g1O0iuciES6H1+TBMKNIWiw+T4c/LKx5AHKt67/m57plQTH+F3f0A30wD6adUgxsZFMhRBm+dAPf9GiM/14FPa6nu8XQ5nz+75oQHwcv1ShsUzOcsTzlxAtbZ49RrXX6aBM557BdFhRxLssls5iQhP6i6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722595722; c=relaxed/simple;
	bh=1UtEsW1B8YGTusoX2RACg6eRJD75Xl/UNssGCGaoLFo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=c93LyOF6fZDgYCjOknhn7cRlYbrkdQRxOjtcxP2qK1iHiXooA16D8/J+v1fH5LPtjJHmU12RznWuS5gWKl5lO0nJDLtJQuv+0LY1FaCGefRZLsv8hTEzx6lj92aKW/4Iq/+jA9zY3gVUG72ntypYLOxH8M3oPV7wfkbWlciv5X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4/tgcIt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDBB6C32782;
	Fri,  2 Aug 2024 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722595721;
	bh=1UtEsW1B8YGTusoX2RACg6eRJD75Xl/UNssGCGaoLFo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F4/tgcItl7OXJuY2RVCfRtvR6VVCv4wUIutjw0GzyZq67a3nOTCgU8OmMj+hG81Hx
	 DrleyO8xaZ9pTlavt4q6a5TDx2cCL3YrPfNu2D2pGxVevWYvCXIMCtBC0GQgLUFY3C
	 ORMos0Y0sKNfEt3fxCco4D1SYDCapTmMyCSGo/k09c6hq7xmWqO7/cgX1REt0Ec0cr
	 T9O1Nu5Qb+7nvkP7hXlPjhScsuljs3NyFr/faO1osK8qkbD9psJtPwWoU9fLwYQ25A
	 2kiWsplk4wwSsIhjiw/arHEUviuDgWLFN/pgdt0tcvq/Wqnyl7HaylvmTgd1R5BFeP
	 n7oGIMwehz3Wg==
Date: Fri, 2 Aug 2024 12:48:38 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Olivier Sobrie <olivier@sobrie.be>
cc: Basavaraj Natikar <basavaraj.natikar@amd.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: amd_sfh: free driver_data after destroying hid
 device
In-Reply-To: <20240723084827.11773-1-olivier@sobrie.be>
Message-ID: <nycvar.YFH.7.76.2408021247560.12664@cbobk.fhfr.pm>
References: <20240723084827.11773-1-olivier@sobrie.be>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Jul 2024, Olivier Sobrie wrote:

> HID driver callbacks aren't called anymore once hid_destroy_device() has
> been called. Hence, hid driver_data should be freed only after the
> hid_destroy_device() function returned as driver_data is used in several
> callbacks.
> 
> I observed a crash with kernel 6.10.0 on my T14s Gen 3, after enabling
> KASAN to debug memory allocation, I got this output:
[ ... snip ... ]
> KASAN reports a use-after-free of hid->driver_data in function
> amd_sfh_get_report(). The backtrace indicates that the function is called
> by amdtp_hid_request() which is one of the callbacks of hid device.
> The current make sure that driver_data is freed only once
> hid_destroy_device() returned.
> 
> Note that I observed the crash both on v6.9.9 and v6.10.0. The
> code seems to be as it was from the early days of the driver.
> 
> Signed-off-by: Olivier Sobrie <olivier@sobrie.be>
> ---
>  drivers/hid/amd-sfh-hid/amd_sfh_hid.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
> index 705b52337068..81f3024b7b1b 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
> @@ -171,11 +171,13 @@ int amdtp_hid_probe(u32 cur_hid_dev, struct amdtp_cl_data *cli_data)
>  void amdtp_hid_remove(struct amdtp_cl_data *cli_data)
>  {
>  	int i;
> +	struct amdtp_hid_data *hid_data;
>  
>  	for (i = 0; i < cli_data->num_hid_devices; ++i) {
>  		if (cli_data->hid_sensor_hubs[i]) {
> -			kfree(cli_data->hid_sensor_hubs[i]->driver_data);
> +			hid_data = cli_data->hid_sensor_hubs[i]->driver_data;
>  			hid_destroy_device(cli_data->hid_sensor_hubs[i]);
> +			kfree(hid_data);
>  			cli_data->hid_sensor_hubs[i] = NULL;
>  		}

This seems reasonable. Basavaraj, can you please provide your Ack for 
this? Thanks,

-- 
Jiri Kosina
SUSE Labs


