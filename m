Return-Path: <linux-input+bounces-14000-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA00CB25DD5
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 09:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CF041B68F3C
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 07:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD8A2820A5;
	Thu, 14 Aug 2025 07:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Q4ehJ9mj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50D828506D
	for <linux-input@vger.kernel.org>; Thu, 14 Aug 2025 07:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755157410; cv=none; b=PXfyrV4oaU/P/Uhr1EUpzdFj1zAlw6/WLqqtcdxKFAQTcUKiY+yvl0CkIpxa4b3NJ3Xs8j3OVH4gHXhizWwSsbFJcD/LnttyZuEeIHpdln1dp/OfdBEvNhPY8MLDHwi+r30O57e8hD1gJRbs+7TAIFaFzn6mx+UHQv1/2pdf0PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755157410; c=relaxed/simple;
	bh=qAgWfAMIF/sZ4uaQqkFCjMJESgODY6hQ+grRgSP7pFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sn3fCQuwT7oDQERIx01fNf9Wp7kXc1mTfUHj6xhV/+9RGOjCKle01Cihekm6JWvhnVzZ0OaH6+hXCMeTiPX0jZ9y/RjomWc4AQWUC8j6TxvBUDyoyWRkyZoiOxHV9RMf4Iv07y9Bh+5Cx4XJOM8Ur/5DdWAMYjO4YIZAjHFez4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Q4ehJ9mj; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afca41c7d7fso276406966b.1
        for <linux-input@vger.kernel.org>; Thu, 14 Aug 2025 00:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1755157407; x=1755762207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jPuQF6+pTC/R1aoe0VWkF/cqD5w1tUDK9xrST9p9p6Q=;
        b=Q4ehJ9mjO3FF/ltRg87CRvPvVz51dQlcEIYaXCJBjUxujImPPltJaXVpzzCb47QX8K
         fpK9o1X1wXGKgkyMQiGwf2+664dPZPtMYw3z02KkkATbBFTPyl1VQ0csoacxe4VyWBC+
         MgfSnVIPeVf4++FJ9fRHyeMwjlh/3WUCU1EY6y/O86bG5hIHk4cXhXQtv1B2qOuRjCba
         j1HHKBIWbK8EYmIOt29iYnsMNDAO4AhmmnfIk0HDwmdrt3WV1tM8YwTDyIQHnat0hMNI
         Y797fiVPrqEBLPxEzO/WLGWYwJ0h+LZXXGy6vrz5p3FDaLHBj8eyt+AWWIWqSOvdF3Ai
         FApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755157407; x=1755762207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jPuQF6+pTC/R1aoe0VWkF/cqD5w1tUDK9xrST9p9p6Q=;
        b=kloIdmmsI/YZvr6nGGTf6ePMRrT9uCde0sagUGrRskVA0MMapujjge4phU6nKAQL8F
         zP96FHqO9PVaC9jjkFdho5I6mUt6c/tf1WtmxIxvpjHL/YTOgPaoIrc7KfjdV5I976Lf
         uepE6PU4HTzvOCzlIWghoQ4y0haYUPc6WW+rFZqm9wKORKWNqE6EmzIHeL/IlWEx5pQV
         3QisR5h/uSHmgEkaRq3PTpqkPGan03EUqJq3WmV3l5KYD1DgzYTKVHysfUXbaGh6Tvf5
         JWmSa5TTKL/yBs0Ek8+APUnIcu3NN8EdSzEqgxRzdhNJjRtVNG+vqXd+khy1id2VSr9o
         rhyg==
X-Forwarded-Encrypted: i=1; AJvYcCWvnQf1b1b8deRWbrjEtTUL16CPaxdOFbOl2gM2AUTXY171XtYCHkrgMBQGcgL8sDir4/CtUFZ/wlBGTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKarIaoJIEm4Nr4uCELZ46MkS3nH2yH+4ZAFl3HiRt8pA5imq0
	uuXLTpbZ43brqzxkVfuzrPf/I1DEAc8Zf1Sr27bVlXJS2gOwEt+e8sOjK8nq5/cl6Hk=
X-Gm-Gg: ASbGnctvjUNQBGjywXND+N7OmcSSn9FE2ojTMzV/nfZyU3xrzh97byXqPY3VUFMpRcq
	l4cu/WJLyvNjUiHyU7z0r0wvi3mz5WsSrqly0wb5P2kRdDKRyyL3Pam85DO25HNNnN90VvKCrUk
	+yKYsDyJ+btygkK58XzaM7YgOUhtT09iqtrTUEJ9bYDdcOM2cydU+HIEutKathrJJW8yxQt3f7y
	K6OgFwirsNbtNGdINlbtefYTrqPl0j1zRKEOj0EmaiSXt+eD7y3OheKIJzB0+r+IK85EKTWyD99
	hh6zFCTZDzb6dSaELETsy6CuOU3VGHGsIXBrGGzgo9GDeJBcHoiZGGprM1tSKxKQ+jvb0jFL7A7
	d4MUVN9SgLiLyGELG9VcRJl1Y7DfeduH3LSQnKD62Yk8mWfmUGy+tzM2W0Mh3g7nkNkM7ILwmrN
	xnIg6zQ1rfMxyt6Q==
X-Google-Smtp-Source: AGHT+IGCzaOzIDJ94jFmyMeyUg84rKzPilT3aLYjT6q7n+bcrWWTqiKm+8lDogVs/9Xr3+ze0xv6lg==
X-Received: by 2002:a17:907:781:b0:af9:8d61:b78e with SMTP id a640c23a62f3a-afcbd9334a5mr149784766b.30.1755157406894;
        Thu, 14 Aug 2025 00:43:26 -0700 (PDT)
Received: from [172.16.220.71] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f26cc6sm23651682a12.23.2025.08.14.00.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 00:43:26 -0700 (PDT)
Message-ID: <d87eedaf-e239-4809-b4cf-61308d5b3a2e@fairphone.com>
Date: Thu, 14 Aug 2025 09:43:26 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] Input: aw86927 - add driver for Awinic AW86927
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Luca Weiss
 <luca.weiss@fairphone.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250811-aw86927-v2-0-64be8f3da560@fairphone.com>
 <20250811-aw86927-v2-2-64be8f3da560@fairphone.com>
 <vuv26omdn4a5jniv6znepcxel65buzymu6te2ys2dgtkttk6sg@edqm6xpddudn>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
In-Reply-To: <vuv26omdn4a5jniv6znepcxel65buzymu6te2ys2dgtkttk6sg@edqm6xpddudn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Dmitry!

On 8/11/25 18:35, Dmitry Torokhov wrote:
> Hi Griffin,
> 
> On Mon, Aug 11, 2025 at 01:12:02PM +0200, Griffin Kroah-Hartman wrote:
(..)
>> +struct aw86927_sram_waveform_header {
>> +	uint8_t version;
>> +	struct {
>> +		__be16 start_address;
>> +		__be16 end_address;
>> +	} __packed waveform_address[1];
> 
> Why does this need to be an array? 

Great question, during development this was used to include multiple 
wave-forms, but it was decided that the feature was unnecessary as of 
now. I will remove the array for simplicity.

>> +static int aw86927_haptics_play(struct input_dev *dev, void *data, struct ff_effect *effect)
>> +{
>> +	struct aw86927_data *haptics = input_get_drvdata(dev);
>> +	int level;
>> +
>> +	level = effect->u.rumble.strong_magnitude;
>> +	if (!level)
>> +		level = effect->u.rumble.weak_magnitude;
>> +
>> +	/* If already running, don't restart playback */
> 
> Why not if effect parameters are changing? Also what if someone is
> issuing stop for already stopped effect?

It it's current state, the driver only has one level of vibration, 
therefore adjusting the effect does not matter as it is either vibrating 
or off.
For your second question I don't think I understand what you are asking. 
If someone gives magnitude 0 to a vibration that has ceased playback, 
the vibration has already stopped, so we don't need to stop it again.

>> +
>> +	haptics->regmap = devm_regmap_init_i2c(client, &aw86927_regmap_config);
>> +	if (IS_ERR(haptics->regmap))
>> +		return dev_err_probe(haptics->dev, PTR_ERR(haptics->regmap),
>> +					"Failed to allocate register map\n");
>> +
>> +	haptics->input_dev = devm_input_allocate_device(haptics->dev);
>> +	if (!haptics->input_dev)
>> +		return -ENOMEM;
>> +
>> +	haptics->reset_gpio = devm_gpiod_get(haptics->dev, "reset", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(haptics->reset_gpio))
>> +		return dev_err_probe(haptics->dev, PTR_ERR(haptics->reset_gpio),
>> +				     "Failed to get reset gpio\n");
> 
> Is it mandatory to wire the reset pin? I see the chip supports software
> reset so maybe this can be optional?

In the datasheet, it is never explicitly mentioned that the pin is 
optional, and in the downstream driver it is mandatory.
If the reset pin is not found the probe will fail.

If somebody has a board with that use-case they can modify this driver 
easily.

>> +
>> +	/* Hardware reset */
>> +	aw86927_hw_reset(haptics);
>> +
>> +	/* Software reset */
>> +	err = regmap_write(haptics->regmap, AW86927_RSTCFG, AW86927_RSTCFG_SOFTRST);
>> +	if (err)
>> +		return dev_err_probe(haptics->dev, PTR_ERR(haptics->regmap),
>> +					"Failed Software reset\n");
> 
> Do you need to issue software reset together with hardware reset? Is
> one or the other not enough?

The datasheet does not mention whether one is enough, the downstream 
driver does it with both so I have assumed that this would be best 
practice with this chip.

>> +	err = devm_request_threaded_irq(haptics->dev, client->irq, NULL,
>> +					aw86927_irq, IRQF_ONESHOT, NULL, haptics);
> 
> Error handling? Also it looks like here it is safe to register the
> interrupt handler early since it does not actually do anything, but
> better to move it after the bulk of initialization in case it will get
> expanded.

I will fix the error handling :). If someone were to implement FIFO mode 
then this would be the correct placement of the initialization, so I 
think for now it would make sense to keep it here.

> 
> Thanks.
> 

Thank you for your comments!

