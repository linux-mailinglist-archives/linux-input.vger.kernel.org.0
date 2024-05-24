Return-Path: <linux-input+bounces-3826-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E93A58CE8F7
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 18:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F26D1F2201F
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 16:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E3F12DDAD;
	Fri, 24 May 2024 16:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="D5lcRmF2"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6138012C464;
	Fri, 24 May 2024 16:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716569907; cv=none; b=EA0rCSo4TpuHhsIJFNtzXvVGU9NSQHfuBRGzrSjjcKx6vYFUS+0ktQXZPXr9WnarpIqjBXA1JKlsexUhUoafy1j7tqOMXZodLiPtNyAiEPf0qMX7oUldY29F0EZEsJpn1lzvdyNGGJ+8erIfXbpuJZMkDEibcOxhFabDXIWhC2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716569907; c=relaxed/simple;
	bh=vyV7Nc3wlmfIWioWQ2BsumXb2wAaUL29TJtLLBo79GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGrdIPAIzWzvCNzvHrloZtaXkoDTHvnGzYH0iBV1qIsGUKesemgNqsMX560BdbkDcc18e+Doc6tpUvIhXe+3xrLTaFjaStZ/U+EiRPvUSPY7KFlJOMAYnTmS2UkchrHQ9CB3dWjNwV4Fcsac9XObkyAjib+q66MVDNQDm5FhQDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=D5lcRmF2; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=+PoKy2cdF3pAHZeUroDK0C95HEcjrlws4+7j8Gz00ZU=; b=D5lcRmF28GtIKKU2
	h7gcO0sH1sBA2VhBcwrQnomsfV/hxtXLeZL5Jh9sqyKeSkxy8QwuGG+2zjZFDtccPz9O6DxzL8E40
	98avY3bFKvEwsJrIQBXyJfsEQuJqMiyi5RkO/1rjctwkTg4HGG5c0TAgNHvqJ+ObRoswUcL6orc0y
	RqjQ6C0iIS0dY7M9ZFVIF76oMjaVWsNqsPdH/tKsp3eFAIYFCJLpD61De7FdiM1RK1SWtskkacmNS
	6AJ1ZKNAhZw0D1XjI7uBpG90qYT4mcHfwRkpAllubxHAvXDZzdLEabx9p8L91dRbjKE2XKEUuIYyP
	2BkYAQXljdTEpDb+DQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1sAYFK-002Qw9-2c;
	Fri, 24 May 2024 16:58:22 +0000
Date: Fri, 24 May 2024 16:58:22 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: dmitry.torokhov@gmail.com, christophe.jaillet@wanadoo.fr
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: tca6416 remove unused struct 'tca6416_drv_data'
Message-ID: <ZlDHLrkv6oHl_EaF@gallifrey>
References: <20240523002910.492558-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20240523002910.492558-1-linux@treblig.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 16:57:45 up 16 days,  4:11,  1 user,  load average: 0.05, 0.01, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* linux@treblig.org (linux@treblig.org) wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'tca6416_drv_data' is unused since the original
> commit 30ba3ead0576 ("Input: add keypad driver for keys interfaced to
> TCA6416").
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Oops, looks like Christophe got there first!

Dave

> ---
>  drivers/input/keyboard/tca6416-keypad.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/input/keyboard/tca6416-keypad.c b/drivers/input/keyboard/tca6416-keypad.c
> index 677bc4baa5d1..b2060229bd0f 100644
> --- a/drivers/input/keyboard/tca6416-keypad.c
> +++ b/drivers/input/keyboard/tca6416-keypad.c
> @@ -32,11 +32,6 @@ static const struct i2c_device_id tca6416_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, tca6416_id);
>  
> -struct tca6416_drv_data {
> -	struct input_dev *input;
> -	struct tca6416_button data[];
> -};
> -
>  struct tca6416_keypad_chip {
>  	uint16_t reg_output;
>  	uint16_t reg_direction;
> -- 
> 2.45.1
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

