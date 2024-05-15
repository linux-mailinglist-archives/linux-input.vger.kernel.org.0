Return-Path: <linux-input+bounces-3720-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 421128C6F13
	for <lists+linux-input@lfdr.de>; Thu, 16 May 2024 01:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0179F1F22D7F
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 23:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A183C48E;
	Wed, 15 May 2024 23:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Obp5hd8J"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB83101C8
	for <linux-input@vger.kernel.org>; Wed, 15 May 2024 23:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715815148; cv=none; b=HUu8N0MoOFtnNQ3etbtnAoR6ENT7Fg5lPS7omnXSSpEsITtOx0qWq0DimNWnN/sQygATHnrekIpd/R9oL/Ni+jDDlua00Sw6aytEgQY1cOerMOeLSCbqck081aGImE9Qyct3LOEZvnksbAAZUv90a4IHzNI0zR6VzgtEgCvq3n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715815148; c=relaxed/simple;
	bh=J2S+7gqow97OzegmMdSLUoPGVdR7wexWgUgGGEUkQCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3/Y4HmJ56MGqM3B9N7a2sGYiP/vMhc+2IalHP3vVelqCfJuCHg2Y2RfbLN/b16rWlHPMejFvnwfctVyS5sP2iBNlLTaHhs04JNp67WboBgk28qsZo9qm28dRK7qAdIRsfkAYDyiKOUlXfHwtl9xXLe4MjCKtvER/qg141MK8Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Obp5hd8J; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5ce2aada130so5296947a12.1
        for <linux-input@vger.kernel.org>; Wed, 15 May 2024 16:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715815146; x=1716419946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+M8JZPC3wpvpVhmu3RmIHA9Z+Wp50Z5izIx6C72/Y1A=;
        b=Obp5hd8JoiRL2EYIo5EJUF37cL4C2pqDSsqsjhWdQXVN3W9b0/D9zaYUZYONDArDTy
         /A+pRT4x9IR2WXwINJC9yqY4qEgea1Od0IkOhTJwe+pATDEdCAZyRpa5SsBvBgqKh566
         +rvMzQ1PAMcEeNQgz5YBKKo8GFwOKaX5gYJgUilgObcZeJgZn/O2CM2NBFvffcpY13g2
         cm8I3Lv29KSGIQciFIJZZWDqDY72jEs+WpSayIYIVgy22cJIH+VKj4IZjgroWd+aV3lp
         385xRKqSZaJckQnQA5dt//suCcrATcdiqV5vwmCnseAiOmHyV8xaD+XCpg4TuCnBjUvt
         MXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715815146; x=1716419946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+M8JZPC3wpvpVhmu3RmIHA9Z+Wp50Z5izIx6C72/Y1A=;
        b=PHZKoyScTt55YyImBz/xDl3kBDbKmOoCpSJpbICyLzVOHjz/ShkkUuBdYJ247W3qNk
         W6FdSmSQvtL46wxDZzFJTLm/wN4wPRm/EHdVu2QTIe6jf+MfCJz2KTWk2CC1WbqteB0v
         5lj1IUvmEnFQ2TbvQ27T4E7c8jzynEAGUe/3lZLgwRjsEBRd8wkebZyD7BoXERDgRVhf
         4eoks4Av8pUAMp1MXY/zMZL5o2i7qWBhWeTnqiSVfzZLUYbkwmuAtWF0zPyyi18m7+gI
         44Zw+jILXYRa+fv9XAkS/uv4w/DFMtdrI19FQ6lRQy0Hn1rEeauucQ3fNAhfbZPzei49
         tgqA==
X-Gm-Message-State: AOJu0YyBPV46IPPs9OkiN9en14Ix9Z1k6YL6LOv5K9pcgQTXZ7fmqDbJ
	9vz5bEZmg3k+ert4V2f5kOH7uCjxyuR3+PZVAQ7wKkinlHIjxFb8MbcwVw==
X-Google-Smtp-Source: AGHT+IFBF0TxIyNgwzHE2iMBx5LiTPRWdkCg5ZrbFdWKSBE4CbGIb8rl1Ih0bHE6WAW8+7LQoglYgg==
X-Received: by 2002:a05:6a20:ce43:b0:1af:cc75:3f79 with SMTP id adf61e73a8af0-1afde234e96mr16315120637.55.1715815145582;
        Wed, 15 May 2024 16:19:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fcda:ecd9:1b3f:e64a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66579sm11659077b3a.24.2024.05.15.16.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 16:19:05 -0700 (PDT)
Date: Wed, 15 May 2024 16:19:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Matthijs Kooijman <matthijs@stdin.nl>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: ilitek_ts_i2c: Use gpiod_set_value_cansleep()
Message-ID: <ZkVC5iwcWiEhq-Dc@google.com>
References: <20240515144943.678260-1-matthijs@stdin.nl>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515144943.678260-1-matthijs@stdin.nl>

Hi Matthijs,

On Wed, May 15, 2024 at 04:49:44PM +0200, Matthijs Kooijman wrote:
> Use gpiod_set_value_cansleep in the ilitek_reset function (called only
> from ilitek_ts_i2c_probe and ilitek_resume).
> 
> Without this change, the driver may print a warning if the reset pin is
> connected to a GPIO chip which can sleep (e.g. a GPIO expander):
> 
> WARNING: CPU: 1 PID: 578 at gpiod_set_value+0x5c/0xd0
> 
> This commit is modeled after commit 7c977019c53ed (leds: lp55xx: Use
> gpiod_set_value_cansleep(), 2023-09-18)
> 
> Signed-off-by: Matthijs Kooijman <matthijs@stdin.nl>
> ---
>  drivers/input/touchscreen/ilitek_ts_i2c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
> index fc4e39b6651a4..236c332de6cdc 100644
> --- a/drivers/input/touchscreen/ilitek_ts_i2c.c
> +++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
> @@ -391,9 +391,9 @@ static const struct ilitek_protocol_map ptl_func_map[] = {
>  static void ilitek_reset(struct ilitek_ts_data *ts, int delay)
>  {
>  	if (ts->reset_gpio) {
> -		gpiod_set_value(ts->reset_gpio, 1);
> +		gpiod_set_value_cansleep(ts->reset_gpio, 1);
>  		mdelay(10);
> -		gpiod_set_value(ts->reset_gpio, 0);
> +		gpiod_set_value_cansleep(ts->reset_gpio, 0);
>  		mdelay(delay);

While we are changing GPIO to the sleeping variant we should also change
these mdelays to usleep_range() and msleep() respectively.

Thanks.

-- 
Dmitry

