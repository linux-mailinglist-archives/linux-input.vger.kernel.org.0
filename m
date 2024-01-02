Return-Path: <linux-input+bounces-1075-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A51238219CE
	for <lists+linux-input@lfdr.de>; Tue,  2 Jan 2024 11:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 486A6B21984
	for <lists+linux-input@lfdr.de>; Tue,  2 Jan 2024 10:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011F2DDA6;
	Tue,  2 Jan 2024 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ABQ8F2tY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2D3DDA7
	for <linux-input@vger.kernel.org>; Tue,  2 Jan 2024 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a2830574764so74855066b.1
        for <linux-input@vger.kernel.org>; Tue, 02 Jan 2024 02:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704191493; x=1704796293; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3uo2Tlt5PNlFfytmy7IbupTsQFgsSvR2/VN09g7vDPo=;
        b=ABQ8F2tYhEzyMB4bkJ/eKb75yEynWhT2YGW9eEX6bXFRJ4+Kd8zJSphu+jMU4+J8NG
         2IHMfti5WOB1NDzq1vM7J8qL5Lc1D6S2QvINaGUQhV5HTl6Y2d2lsb3b71u/nXL70+0l
         6poeVIsGRVvjp2cWUyhW4zED0sOW8C7cvALaq5fvlpCkK5V+aRBP0KxDx+x+ow5ylZAY
         /P0yogiu2QG+CtYTD7349hIUz5YyKvSQhwEjjKkq2RWlufA4hq5eknzcSWZwCrnp35mH
         Oq7Rx3goZswZoAXfdjzl0M1AFZaxmBrE/Rism/VT7ZXY2IhVIOJxpDKrBmVAGG1bP1XH
         xtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704191493; x=1704796293;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uo2Tlt5PNlFfytmy7IbupTsQFgsSvR2/VN09g7vDPo=;
        b=TI8Njr2hXJq8TTf+FRZjXS70xfVxugUEYMwzJaLTKMT4Hjzs6/gV9tmiC3gJqPJ80c
         MTunjbv5nPIP/5m5JxlATQg8BcOxZBA6Veo7u2o3c5QU+8FoqIKg9kDmu/9etU3Ss54C
         euktnmvUirheUinKxIGU3zIVPcXjDvbvLSSBsTm24zfYXh/JKkmoMzNeQPcyrr5iA6L8
         JyM1NOZdw4YAKnLk2NBqMiKEIHrE9lOHguuzKHBF6Gm6XrhXHzZnskbMioEDtqXpUpb/
         hFPYulT1JrAi+1AZaHRbkAeI3k5znVpjk37+Ricg3UToAKViPmCAlc8u5sDL4moTERp+
         e6dg==
X-Gm-Message-State: AOJu0YxIQJNRDSuron/jBzMhH62VWYlTTSOyhk/om2YAzBoBsrYVdTI/
	nZUdmsyRf2Kg6oDiH9QWFIsMkL7D3NmOuw==
X-Google-Smtp-Source: AGHT+IHU2aJgBWBK6zf9NwXwlyAr52pOBalLA8+OerTHl4J+zRE6N0bDgnl9du9GMVED+x5KWRUA6g==
X-Received: by 2002:a17:907:101b:b0:a23:1163:24be with SMTP id ox27-20020a170907101b00b00a23116324bemr7646706ejb.95.1704191493272;
        Tue, 02 Jan 2024 02:31:33 -0800 (PST)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id rn28-20020a170906d93c00b00a26b036affbsm10706526ejb.96.2024.01.02.02.31.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jan 2024 02:31:33 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Tue, 2 Jan 2024 11:31:34 +0100 (CET)
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, 
    robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
    benjamin.tissoires@redhat.com, linus.walleij@linaro.org, 
    dianders@chromium.org
Subject: Re: [PATCH v3 0/2] HID: i2c-hid: elan: Add ili2901 timing
In-Reply-To: <20231227085013.1317-1-xiazhengqiao@huaqin.corp-partner.google.com>
Message-ID: <nycvar.YFH.7.76.2401021131220.29548@cbobk.fhfr.pm>
References: <20231227085013.1317-1-xiazhengqiao@huaqin.corp-partner.google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Dec 2023, Zhengqiao Xia wrote:

> ILI2901 requires reset to pull down time greater than 10ms,
> so the configuration post_power_delay_ms is 10, and the chipset
> initial time is required to be greater than 100ms,
> so the post_gpio_reset_on_delay_ms is set to 100.
> 
> Change in v3:
> - PATCH 1/2: Modify title and commit
> - PATCH 2/2: No change
> - Link to v2: https://lore.kernel.org/all/20231226023737.25618-2-xiazhengqiao@huaqin.corp-partner.google.com/
> 
> Change in v2:
> - PATCH 1/2: Modify compatible properties values
> - PATCH 2/2: No change
> - Link to v1: https://lore.kernel.org/all/20231225092843.5993-3-xiazhengqiao@huaqin.corp-partner.google.com/
> 
> xiazhengqiao (2):
>   dt-bindings: HID: i2c-hid: elan: Introduce Ilitek ili2901
>   HID: i2c-hid: elan: Add ili2901 timing
> 
>  .../devicetree/bindings/input/elan,ekth6915.yaml          | 5 +++--
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c                     | 8 ++++++++
>  2 files changed, 11 insertions(+), 2 deletions(-)

Now queued in hid.git#for-6.8/elan. Thanks,

-- 
Jiri Kosina
SUSE Labs


