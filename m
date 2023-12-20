Return-Path: <linux-input+bounces-885-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8351C819693
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 02:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B63FC1C2549D
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 01:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2291A595;
	Wed, 20 Dec 2023 01:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ehSHLCwe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9351A582
	for <linux-input@vger.kernel.org>; Wed, 20 Dec 2023 01:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6d9f9fbfd11so3818023a34.2
        for <linux-input@vger.kernel.org>; Tue, 19 Dec 2023 17:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703037198; x=1703641998; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ljN/oTKoVa49WwYNWrXofjg181ggZekuuOcCJVEtRlU=;
        b=ehSHLCweBd/p6taZe1lc3ww6isRFAKpQ+3X3kPrhInZEz/fkPBF8hAQEjUvTkRlr5l
         UwvpDGCl34sZQwW54sJgqiha67SXkST63vHlX27SjYU0ZUijlsDY+4Mo5zwNSU+dIvXc
         plyS5BFkxDOa1J1adX7UbprtJ2DGjDgqVLy5lAEqiGFWfhhDZZivHZApjLPlpGZvihfN
         Mt9SFaH2AW4wXi8wWzLpYNNHhA5O58MY/NdxHb4zdmm5GFnj8xcMExF+gXtK69JSTp/u
         CMCj6qBZP4P3yMDh4Jd/KGuou/NeF+ZlCTeHR63YqqV/zboIm6SSCHlO6aCCPbEfdwYd
         xRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703037198; x=1703641998;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljN/oTKoVa49WwYNWrXofjg181ggZekuuOcCJVEtRlU=;
        b=OhnXppHOxIEMEzVGHG1iNs+8STxuIffWZzWrQKVmugSPmW9zPkYUPz1CjCuhqatZUp
         /7/0YV6ngNJdGus8N+4RpUi64/mYG6V74ZUi8KPC83nMFkPBSer46+fhBgREZuRtvg+T
         okHfuQWETbJe7SLwao/9h3SRWwdxyiI/BV9Sdjmozze24BnVosUykODjqtqavTLylpJn
         Xf6Nfw183gdDloGborHFsLM3ImBBHZEgnVWSJ7GSt6RaCRgfGGJNcuaRP/MGDBDu7zNj
         BZ+fpe+oYJ2NyyJJk7QgBBH6KWFn5jaQ0qvBrtZhtgZvAe4q6IIHZ/kpp7GD0kWwfVjs
         YkuQ==
X-Gm-Message-State: AOJu0Yzr39msyevo56PmHVSjwA5f9KvSk6odtMBT0cn1hRyY2VvACgAh
	fRoTAWgZ8RVJbX9idLO2MeY=
X-Google-Smtp-Source: AGHT+IEiuTjw3uYcKD8EyE2wHYcu4VF42ERcF7VSOhEdcTXvTRHfXOjCjByjKSttgDsg36MpAPIE6g==
X-Received: by 2002:a05:6808:22a4:b0:3ae:1298:257a with SMTP id bo36-20020a05680822a400b003ae1298257amr19841457oib.1.1703037198167;
        Tue, 19 Dec 2023 17:53:18 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:b2ca:95aa:9761:8149])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006d9137418a9sm2847193pfl.172.2023.12.19.17.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 17:53:17 -0800 (PST)
Date: Tue, 19 Dec 2023 17:53:15 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Peter Hutterer <peter.hutterer@who-t.net>,
	Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
	svv@google.com, biswarupp@google.com, contact@artur-rojek.eu,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH] input: uinput: Drop checks for abs_min > abs_max
Message-ID: <ZYJJC-ID4SyHhuuA@google.com>
References: <20231218171653.141941-1-macroalpha82@gmail.com>
 <20231219235149.GA3401344@quokka>
 <f77b98bf015bf3f8716422ac70c4fd6051e66376.camel@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f77b98bf015bf3f8716422ac70c4fd6051e66376.camel@crapouillou.net>

Hi Paul,

On Wed, Dec 20, 2023 at 01:38:39AM +0100, Paul Cercueil wrote:
> Hi Peter,
> 
> Le mercredi 20 décembre 2023 à 09:51 +1000, Peter Hutterer a écrit :
> > On Mon, Dec 18, 2023 at 11:16:53AM -0600, Chris Morgan wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > Stop checking if the minimum abs value is greater than the maximum
> > > abs
> > > value. When the axis is inverted this condition is allowed. Without
> > > relaxing this check, it is not possible to use uinput on devices in
> > > userspace with an inverted axis, such as the adc-joystick found on
> > > many handheld gaming devices.
> > 
> > As mentioned in the other thread [1] a fair bit of userspace relies
> > on
> > that general assumption so removing it will likely cause all sorts of
> > issues.
> 
> There is some userspace that works with it though, so why restrict it
> artificially?
> 
> The fact that some other userspace code wouldn't work with it sounds a
> bit irrelevant. They just never encountered that min>max usage before.
> 
> And removing this check won't cause all sort of issues, why would it?
> It's not like the current software actively probes min>max and crash
> badly if it doesn't return -EINVAL...

It will cause weird movements because calculations expect min be the
minimum, and max the maximum, and not encode left/right or up/down.
Putting this into adc joystick binding was a mistake.

This is the definition of absinfo:

/**
 * struct input_absinfo - used by EVIOCGABS/EVIOCSABS ioctls
 * @value: latest reported value for the axis.
 * @minimum: specifies minimum value for the axis.
 * @maximum: specifies maximum value for the axis.
 * @fuzz: specifies fuzz value that is used to filter noise from
 *	the event stream.
 * @flat: values that are within this value will be discarded by
 *	joydev interface and reported as 0 instead.
 * @resolution: specifies resolution for the values reported for
 *	the axis.
 *
 * Note that input core does not clamp reported values to the
 * [minimum, maximum] limits, such task is left to userspace.
...
 */

(We should change wording of the last sentence to "... does not always
clamp ..." since when we do inversion/swap we do clamp values.)

And note that the userspace that can handle swapped min and max will
work fine if the kernel provides normalized data, but other software
will/may not work.

Thanks.

-- 
Dmitry

