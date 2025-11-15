Return-Path: <linux-input+bounces-16122-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED71EC608D1
	for <lists+linux-input@lfdr.de>; Sat, 15 Nov 2025 17:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BA293B6146
	for <lists+linux-input@lfdr.de>; Sat, 15 Nov 2025 16:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AD44A32;
	Sat, 15 Nov 2025 16:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxoYw9zB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEF427B335
	for <linux-input@vger.kernel.org>; Sat, 15 Nov 2025 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763224928; cv=none; b=HgMW6MF8gIEnZfH4Zg0C+roQId9sxtF1l/ixdE4ishFYvAtcMCoyn7gLl/2rYhMLG8AROJA0RTZ3ZI9DzAxC6h5UPkgVWX3en7e9hLypMZMIiEi+yAgjN1ofIoRPbnvQMq6pEJJpdSeTuJARamhNq8e8M5XT2+LIZj1I2VU0HvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763224928; c=relaxed/simple;
	bh=ypidr3yCXb6MkEFOyW7jEr2iiq5ZZ3mQZfvUri5g59Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CsurVlf/rIWMXVGzpBcssIgrtJIYaRit3YhMjho0VU+KeZVdE/pARSQrp7DzCMGscG5HdTMAbuZ6WvbqPoggC3hA7wtchQqYp08O31pa9gHKV1zXJM3ig0HzjvhB+P/kWBIOnoHnSltJCN/fUtJGThnELwOhZoFJgwH9KpGJxfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxoYw9zB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso15652785e9.2
        for <linux-input@vger.kernel.org>; Sat, 15 Nov 2025 08:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763224924; x=1763829724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZkXXga2FwO0yk6EOdrIchUhL8q+oQ8tX5GzWjXdcVuE=;
        b=XxoYw9zBiNs86WlOQ1+UfGlCk0S6914VF2uZkIN+F/ObHIyb1/TuRyPr1mQeJFg0RX
         Air/lUTt2xNVdHDFjdPkPMyRdBkLM9OqlrMCM1/IJVj+JVhYo8uXwA10sfUDdmmPtCaw
         Un3O/hsZ9NItef8WuIvZhCVtjZUwKP7UdDEq7vcemPrUytRh+JTBgHgGS+FYMFL2c/tt
         YIuNuMdd2EH5syjuvGOy9TV7H26WiOPB7NoEbd8xrhKqCa3+9UH5BbIayU5WX6I/PUqt
         VWDkduYerShjxHZTpkjdS7Q4PCsX+XVvxCZ85OXDBbGuqGe4UCQ04M12XblYmNWq1KeH
         evYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763224924; x=1763829724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkXXga2FwO0yk6EOdrIchUhL8q+oQ8tX5GzWjXdcVuE=;
        b=X2P/rNnX1nR1kclxd40CGtN77dWd2eBoX4WJfnAr70F60wRF5AypHeisgDccTgsNj7
         saNcXFuZznQnwNx5OyBi3pK1BeAUwSw7/Txm7JSQU/Rhorr6eaHRFiQwJj6QWRyDGtsI
         F+CXNW2fZN/NKGHg9bEg13G2ZyTR8ssWsxaEraxPudFRKWZvwfQPQiNstNbh6FOBZJcE
         7dugrevJ5e4CTs/yE3lXc1vQHfr+tb7HG9mFPW8EVlVv/7mISTJp2W3dThOfNewaOg4p
         3AtiWySXLIgJjFxeJw9iYfmZtRlTFH/1DZkSCX6hB+GEWNxn+rmLmoz592F/xQ9UGoVy
         0EeQ==
X-Gm-Message-State: AOJu0Yz5YQKdxZRVmIUCGavYQ8hREXuHS9MVeR03XsS9lwWWAqZW2UBH
	ZWkzSk0b76Uvu4Blb5XrInWWOibiD82KsRzgsM9yrV3D7CLgXYwJSyAW+6+h0Jsyjwg=
X-Gm-Gg: ASbGncsSCIuD4RLNIb7rA0fV38+jSQyNHbJFDd2AEXxkqASKuMyTvsb6W/GxRNuSWus
	gbbCGM/wDF72BHFvyVtqoNxmGF/EvGD5vJ0XVLHrp5GTQbiJDPPJokwRjMvbGzqDAlwq3Ki9nWG
	hKgnOr80qzpPv4jhdW3MChGNEAUW0avH7gX9d16v1ifBM8bGZdGmp+OiV0IZyDcfpsCaX53/GN1
	Q/c0LQtr6c8bc3po9oXAWpY+T5gbsy0sQhRKk/rqkm+SndK1DeE5zUsiKeQdJljrqOvC5S0Eb/r
	+oLQLtKYLCCVjq9vSkTUYK1PaP6gp60H7mf+g/Ml7m0KgywlanpuKqy/XQjwxZrfMPpMa6ZfmK5
	c54JJ5kKU3zZMOG8Ev40TvZSiGV9M5a/WhuGhHQ5IQizvWVRIj2/iH6SvARE5ntCKsOHFeE6BUX
	wcHxpWAqM2Cw==
X-Google-Smtp-Source: AGHT+IFmggZu9dVYC7kYNPptmYnYI+Tb7o0NBL19bTsxBOx/IB2Q47HXCIYcuJjvS8T/F4LlFOD2VA==
X-Received: by 2002:a05:600c:45d5:b0:477:7af8:c88b with SMTP id 5b1f17b1804b1-4778fe57241mr64562195e9.11.1763224923744;
        Sat, 15 Nov 2025 08:42:03 -0800 (PST)
Received: from [192.168.1.12] ([197.46.78.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47799768409sm40900455e9.3.2025.11.15.08.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Nov 2025 08:42:03 -0800 (PST)
Message-ID: <b2c6440b-f6a8-4927-af07-01d2b950fc2f@gmail.com>
Date: Sat, 15 Nov 2025 18:42:02 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: memory leak in dualshock4_get_calibration_data
To: Max Staudt <max@enpas.org>, roderick.colenbrander@sony.com,
 jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com
References: <20251115022323.1395726-1-eslam.medhat1993@gmail.com>
 <3aca217a-4cf3-4793-855a-39ed99eb81d2@enpas.org>
Content-Language: en-US
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
In-Reply-To: <3aca217a-4cf3-4793-855a-39ed99eb81d2@enpas.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/15/25 15:22, Max Staudt wrote:
> Thank you Eslam for catching this!
>
> That mistake was mine, and your fix looks good to me.
>
>
> Reviewed-by: Max Staudt <max@enpas.org>
>
>
>
> I think your patch may be a candidate for the -stable tree:
>
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst 
>
>
>
sure, will submit a backport there too.
>
> Thank you for your help :)
>
No thank you 🙂
> Max
>
>

