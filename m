Return-Path: <linux-input+bounces-845-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 413FF817CEC
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 22:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E65CAB23CC5
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 21:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFB073487;
	Mon, 18 Dec 2023 21:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Sergh8Ia"
X-Original-To: linux-input@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92065740AB
	for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 21:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7kBDAp8ZU1AgRO3Nw/HPGKErjmejmNvBagMEqhi5o48=; b=Sergh8IaIundnutG6N1pU/SkMa
	Z0q7M8pgp5TwGELJUtwyBiXIG/Q9657vPz5g+CPeEVaZdgodR31R+Ztyt7H1yhqS4VPmOluq95BgX
	/Vwdz6PJahitR44dYLL3mppDo4CNBl9fhqejyKEDYHe0Zhli/L8Wr9yfIP5p6C1Wq4p6RPc9GSLbW
	OV+Koh9thsifehINEKW0Hbs42P/CtC8kEZIhmoZQHqBjS9HcfDas6Y1DXSGVRKvsaPcSliRIFp0D3
	19Gz/SJ0p+UF4sLMA9DHNMzya7Hu37Lxw+bmcJKqnzolk5+UMat8trefcI8DpzIexx+u6LeOkQx8e
	3vBhuuig==;
Received: from [177.68.247.242] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rFLRI-00FNOY-Dh; Mon, 18 Dec 2023 22:46:16 +0100
Message-ID: <dcd91e66-11ce-c576-5eb7-8756a1b6f222@igalia.com>
Date: Mon, 18 Dec 2023 18:46:09 -0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] HID: nintendo: Prevent divide-by-zero on code
Content-Language: en-US
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>, jikos@kernel.org
Cc: djogorchock@gmail.com, linux-input@vger.kernel.org,
 benjamin.tissoires@redhat.com, kernel@gpiccoli.net, kernel-dev@igalia.com
References: <20231205211628.993129-1-gpiccoli@igalia.com>
 <87o7enxn1x.fsf@protonmail.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <87o7enxn1x.fsf@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/12/2023 17:39, Rahul Rameshbabu wrote:
> [...]
> 
> Hi Guilherme,
> 
> I agree with the previous hunks you added and can see how those could
> trigger the divide-by-zero issue you were seeing. However, I am not sure
> if this hunk that I have left makes sense.
> 
> Reason being, is that the hid-nintendo driver has a special conditional
> to prevent divide-by-zero in this case without this change.
> 
> 1. If the first packet has not been received by the IMU, set
>    imu_avg_delta_ms to JC_IMU_DFLT_AVG_DELTA_MS.
> 2. Only change imu_avg_delta_ms when imu_delta_samples_count >=
>    JC_IMU_SAMPLES_PER_DELTA_AVG.
> 3. If that change leads to imu_avg_delta_ms being 0, set it to 1.
> 
> With this logic as-is, I do not see how a divide by zero could have
> occurred in this specific path without your change. I might be missing
> something, but I wanted to make sure to avoid integrating a hunk that
> does not help.
> 
> Would it be possible to retest without this hunk?
> 

Hi Rahul, thanks for your review.

I think I see ... I covered both bases in this patch, but IIUC after
your points above and better looking the code:

(a) imu_avg_delta_ms is set to JC_IMU_DFLT_AVG_DELTA_MS and it can only
change iff imu_delta_samples_count >= JC_IMU_SAMPLES_PER_DELTA_AVG.

(b) But the if path related with the imu_delta_samples_count is the one
that also guards the divide-by-zero, so effectively that error condition
cannot happen outside that if path, i.e., my hunk changed nothing.
Ugh...my bad.

At the same time, the hunk is harmless - it's up to Jiri to decide, we
can drop it (either directly by git rebasing or I can send a V2 if Jiri
prefers), or we can keep it.

I can try to test internally, github testing may be a bit uncertain in
the timeframe (specially during holidays season). If Jiri thinks the
hunk is harmless and no change is necessary, I'd rather not bother
people for testing now (I don't have the HW).

Cheers,


Guilherme

