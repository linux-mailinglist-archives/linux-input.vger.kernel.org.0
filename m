Return-Path: <linux-input+bounces-7045-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E4798F005
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 15:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38A852825C2
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 13:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0448F1581F8;
	Thu,  3 Oct 2024 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="zN0Ed6fM"
X-Original-To: linux-input@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB261993B2;
	Thu,  3 Oct 2024 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727960948; cv=none; b=IZcy0U9hgoTUSF8tPc43kXnItCLVIrCP3v/MLPM3FrPF5HC/LmUn9qDRVrN/CyHgE1M4Fw4510laYao15211ljcA2irHCfKTod3C4GlIGXSs52OY44Ogov2omBJRXxDpzEWAfA9O98GO+PiBQ4p6SSGvuphLfUtXPMtOXjgMJ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727960948; c=relaxed/simple;
	bh=vffrG/SG6BDR0+ImyLcwywuTxZXA8qdTA++/dF+I3BE=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=HofHPuFuGELsPJ7uXpojpVru9glvCM0Gs/UOctYCky3qi69xz46b4uQI6jtaCoNe0k07a+Nt+FhEiNkFy4Z76zEejX9Oiu01ZUhZiX3nd0SrydNwf919awAy7GKO0juew2vp0DyiwvRSI7EHqGK2O2iFU4l/S9tKF5O0dpbzO6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=zN0Ed6fM; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1727960937; bh=vffrG/SG6BDR0+ImyLcwywuTxZXA8qdTA++/dF+I3BE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zN0Ed6fMz0yszGsEPNJNQVP+yiIMtiDyR+S/uLWEMhGNP+zmsH8c0DvrHoh9AfO9L
	 N8HR6csGrEmdpigmTpCgg24TnO0mvMolPc1D8Uhbi7j+VQYCPKMwPpZT7Zh7mQg567
	 /ECRoMGcQwG86JwIWWvJ7r+B8JpacrBiprFc+9TWJdCffMoqRXjA5BWQGkflpYVlN5
	 CC0CZCsSSpakQ0Hpv4U8kDiakCkdPQCgidi5QA/NLLw/HhEMkO415jL0u+4SjFzAAr
	 Sz9FCiLdExs7wJVxUnFbgblNrDLeQQCwfCP8BvKbVszId0GVk0ySzTvXJORNIzIbgE
	 w9KzL2oR2ebcQ==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 786E9234EB;
	Thu,  3 Oct 2024 18:08:57 +0500 (+05)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 03 Oct 2024 18:08:57 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jakob Hauser <jahau@rocketmail.com>
Subject: Re: [PATCH] Input: zinitix - Don't fail if linux,keycodes prop is
 absent
In-Reply-To: <Zv6Dai0WOSn8GOsr@google.com>
References: <20241002-zinitix-no-keycodes-v1-1-e84029601491@trvn.ru>
 <Zv6Dai0WOSn8GOsr@google.com>
Message-ID: <0559f42a6a1ff5813884a4a78de23f54@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dmitry Torokhov писал(а) 03.10.2024 16:43:
> Hi Nikita,
> 
> On Wed, Oct 02, 2024 at 06:01:48PM +0500, Nikita Travkin wrote:
>> When initially adding the touchkey support, a mistake was made in the
>> property parsing code. The possible negative errno from
>> device_property_count_u32() was never checked, which was an oversight
>> left from converting to it from the of_property as part of the review
>> fixes.
>> 
>> Re-add the correct handling of the absent property, in which case zero
>> touchkeys should be assumed, which would disable the feature.
>> 
>> Reported-by: Jakob Hauser <jahau@rocketmail.com>
>> Tested-by: Jakob Hauser <jahau@rocketmail.com>
>> Fixes: 075d9b22c8fe ("Input: zinitix - add touchkey support")
>> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
>> ---
>>  drivers/input/touchscreen/zinitix.c | 33 ++++++++++++++++++++++-----------
>>  1 file changed, 22 insertions(+), 11 deletions(-)
>> 
>> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
>> index 52b3950460e2..1f726653940c 100644
>> --- a/drivers/input/touchscreen/zinitix.c
>> +++ b/drivers/input/touchscreen/zinitix.c
>> @@ -645,19 +645,30 @@ static int zinitix_ts_probe(struct i2c_client *client)
>>  		return error;
>>  	}
>>  
>> -	bt541->num_keycodes = device_property_count_u32(&client->dev, "linux,keycodes");
>> -	if (bt541->num_keycodes > ARRAY_SIZE(bt541->keycodes)) {
>> -		dev_err(&client->dev, "too many keys defined (%d)\n", bt541->num_keycodes);
>> -		return -EINVAL;
>> +	error = device_property_count_u32(&client->dev, "linux,keycodes");
>> +	if (error == -EINVAL || error == -ENODATA) {
>> +		bt541->num_keycodes = 0;
>> +	} else if (error < 0) {
>> +		dev_err(&client->dev, "Failed to count \"linux,keycodes\" property: %d\n", error);
>> +		return error;
>> +	} else {
>> +		bt541->num_keycodes = error;
>>  	}
>>  
>> -	error = device_property_read_u32_array(&client->dev, "linux,keycodes",
>> -					       bt541->keycodes,
>> -					       bt541->num_keycodes);
>> -	if (error) {
>> -		dev_err(&client->dev,
>> -			"Unable to parse \"linux,keycodes\" property: %d\n", error);
>> -		return error;
>> +	if (bt541->num_keycodes > 0) {
> 
> I think this check is not needed and "if" can be folded into "else"
> above. But anyways, do you mind if I rewrite it as follows:
> 
> 	...
> 
> 	n_keycodes = device_property_count_u32(&client->dev, "linux,keycodes");
> 	if (n_keycodes < 0) {
> 		error = n_keycodes;
> 		if (error != -EINVAL && error != -ENODATA) {
> 			dev_err(&client->dev,
> 				"Failed to count \"linux,keycodes\" property: %d\n",
> 				error);
> 			return error;
> 		}
> 	} else if (n_keycodes > 0) {
> 		if (n_keycodes > ARRAY_SIZE(bt541->keycodes)) {
> 			dev_err(&client->dev,
> 				"too many keys defined (%d)\n", n_keycodes);
> 			return -EINVAL;
> 		}
> 
> 		error = device_property_read_u32_array(&client->dev,
> 						       "linux,keycodes",
> 						       bt541->keycodes,
> 						       n_keycodes);
> 		if (error) {
> 			dev_err(&client->dev,
> 				"Unable to parse \"linux,keycodes\" property: %d\n",
> 				error);
> 			return error;
> 		}
> 
> 		bt541->num_keycodes = n_keycodes;
> 	}
> 
> 
> Or maybe to avoid checking for specific error codes we should do:
> 
> 	if (device_property_present(&client->dev, "linux,keycodes")) {
> 		bt541->num_keycodes = device_property_count_u32(&client->dev,
> 								"linux,keycodes");
> 		if (bt541->num_keycodes < 0) {
> 			error = bt541->num_keycodes;
> 			dev_err(&client->dev, ...);
> 			return error;
> 		}
> 
> 		...
> 	}
> 

Oh, yeah, I didn't think of that but explicitly checking the presence
makes the code easier to read. I think both options are fine but I'd
prefer the (imo) easier to read second one. Should I submit a v2 or
you're planning to fast-track it?

Thank you for looking at this!
Nikita

> 
> Thanks.

