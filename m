Return-Path: <linux-input+bounces-6106-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAB596A6B3
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 20:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09166B22B6F
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 18:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8E31917E9;
	Tue,  3 Sep 2024 18:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCVAeqyQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FAE15574F;
	Tue,  3 Sep 2024 18:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725388843; cv=none; b=vBCZ6b0w9JGs09tPFawfxJBfE9TcNlYt8jeeEo/SeJxq2iJZqj81fcI2CV+iZaOaHTdNq76rX1sjiGFMaXX+rSPydF5F72pYgZCfodiZCmR1ws2jFWq3vkhVL7Kk8Kqe0cNyE3wqHBt/NIBnCcjgDRWBPciaRyKndeobLa3phBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725388843; c=relaxed/simple;
	bh=O0ueIPA3TfCbFwkD/G6Tfz3Wi9LnRBhHUqC09xoX6ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZCfW1EvRYIpmIoGZNjlk258w3uj/2W4C7oMR5hD/Ku/wjXli4N1VwOY5vFer8FQmNRtaBSZkLxRjBO71ZgghfUxauGpQo+99L+KbFaRxIvnFRbOHailmjUkKp7yoZoE/KBhxQrsT4EWEA2bJLFBhrV4dX3aY9T8BAv47q19Xpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCVAeqyQ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2d8881850d9so2807283a91.3;
        Tue, 03 Sep 2024 11:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725388841; x=1725993641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6wjgG2ajpqw1hRzc/uMgFC+dB34lcDpuPyL3goEF6q0=;
        b=kCVAeqyQTR3ah+zBa+skMQwu8L3nx5MQcuxw5RoXjrXkIRkBllRCvKOXOLw4TcJGGA
         KXdETwPMlbVVncHfdXRtssqQDlEDdVj4qvlRkuGTCC1Sh+Jzbs2HbhC8HTAGvtzp1Orm
         W/hri/ws84FOoi4iYG6Q8OOiCoI4wnkV1UWHGVWOMZhrpjXJ3LTgkQyDu8U9K8HHk+hA
         /n1KHP+TtkzvbqU150tBOzNet1lIpwCMPq/3fM+qRcNG1VueQjFA60jdVvneJqfxP4qf
         WkB9+4e44/vU60Mo1gsG+720n0X5gw1AlywnwHuADL3Oc3DTP4cFK6gAFVIW+e+HgkkA
         VALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725388841; x=1725993641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wjgG2ajpqw1hRzc/uMgFC+dB34lcDpuPyL3goEF6q0=;
        b=cS4lGc17EOT0WUGCjB1HbsPBakS1leEQAU7E1luCq5pdRo/g7Vyvkb0JvnFQuUmbX/
         JLOhI8AHwL91/k0XhIfyELPNOOIT7SLAQKvDzo8dHWsZDMfFYzD+ohiniZIOV12HZKfm
         +INbV11l9XRFb/vGvshv2b43HMULQv+ncygkN+2dyLodUXjdUvoww6ty3WYwrrcLHSS7
         8H6S+f9qJPeHT9/uzjU2X2mDyTwGd4JWkugKafIfR03EeN/eNFNCDUyUAVd0K5WsjL5y
         4A/jZkLeyk6lBYX8e8iZpbnMjRJj99pMXgp7msrSlwHVw746AJpa7ZEqzjEyjpSs9XpF
         Yp2A==
X-Forwarded-Encrypted: i=1; AJvYcCWuc5vweyEtkJqoCjmRaecrghPvF2Ne/C1UpL4dEqmZlGnle0WhVQ65i21x/mUFd1cZTtHcNWkMFyH3DQ==@vger.kernel.org, AJvYcCX9+jA12acMvAzAxcvhFpNQ9p9irP7CERBTl+cMTXaFbae8a5IZRT/qit9RksfWXIY+sufcAxno1FQLxHs0@vger.kernel.org
X-Gm-Message-State: AOJu0YxVijht9rZRuBNQS1SGZ/u02hGncT2sdr81xzAKO9cSiikg7/VM
	KDeD0WFQn/U1YCIuXqSDuFLhW6x+yHMm1dZq1DPH7L2m04J3NSR9
X-Google-Smtp-Source: AGHT+IHgSutBHeWXw3YJPZ+Yxrdbk7ePwFYldx07gliZ3r1PpfRrHRWr4ftgUOJEMVjexUm+jTrU9A==
X-Received: by 2002:a17:90b:3b8f:b0:2d3:d95a:36dd with SMTP id 98e67ed59e1d1-2da62ccd76bmr3038201a91.8.1725388841154;
        Tue, 03 Sep 2024 11:40:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8b966948asm5775776a91.17.2024.09.03.11.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 11:40:40 -0700 (PDT)
Date: Tue, 3 Sep 2024 11:40:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Marge Yang <marge.yang@tw.synaptics.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vincent Huang <Vincent.Huang@tw.synaptics.com>,
	david.chiu@tw.synaptics.com, derek.cheng@tw.synaptics.com,
	sam.tsai@synaptics.com
Subject: Re: [PATCH V2] Input: synaptics-rmi4 - Supports to query DPM value.
Message-ID: <ZtdYJkU17y1iNsLG@google.com>
References: <20240805083636.1381205-1-marge.yang@tw.synaptics.com>
 <ZtdQW7nqAOEJDNBN@radian>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtdQW7nqAOEJDNBN@radian>

On Tue, Sep 03, 2024 at 02:07:23PM -0400, Richard Acayan wrote:
> > +	/* Use the Query DPM feature when the query register exists for resolution. */
> > +	item = rmi_get_register_desc_item(&f12->query_reg_desc, RMI_F12_QUERY_RESOLUTION);
> > +	if (item) {
> > +		offset = rmi_register_desc_calc_reg_offset(&f12->query_reg_desc,
> > +			RMI_F12_QUERY_RESOLUTION);
> > +		query_dpm_addr = fn->fd.query_base_addr	+ offset;
> > +		ret = rmi_read(fn->rmi_dev, query_dpm_addr, buf);
> > +		if (ret < 0) {
> > +			dev_err(&fn->dev, "Failed to read DPM value: %d\n", ret);
> > +			return -ENODEV;
> > +		}
> > +		dpm_resolution = buf[0];
> > +
> > +		sensor->x_mm = sensor->max_x / dpm_resolution;
> > +		sensor->y_mm = sensor->max_y / dpm_resolution;
> > +	} else {
> > +		if (rmi_register_desc_has_subpacket(item, 3)) {
> 
> The item variable is NULL in this branch, as it was overwritten just
> before the if statement.
> 
> This patch causes a NULL pointer dereference:

Ugh, indeed. I guess the simplest way of fixing this would be:

diff --git a/drivers/input/rmi4/rmi_f12.c b/drivers/input/rmi4/rmi_f12.c
index fc2cc8e2b0ba..8246fe77114b 100644
--- a/drivers/input/rmi4/rmi_f12.c
+++ b/drivers/input/rmi4/rmi_f12.c
@@ -129,9 +129,8 @@ static int rmi_f12_read_sensor_tuning(struct f12_data *f12)
 	 * Use the Query DPM feature when the resolution query register
 	 * exists.
 	 */
-	item = rmi_get_register_desc_item(&f12->query_reg_desc,
-					  RMI_F12_QUERY_RESOLUTION);
-	if (item) {
+	if (rmi_get_register_desc_item(&f12->query_reg_desc,
+				       RMI_F12_QUERY_RESOLUTION)) {
 		offset = rmi_register_desc_calc_reg_offset(&f12->query_reg_desc,
 						RMI_F12_QUERY_RESOLUTION);
 		query_dpm_addr = fn->fd.query_base_addr	+ offset;

Could you please tell me if this works for you?

Thanks.

-- 
Dmitry

