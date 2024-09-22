Return-Path: <linux-input+bounces-6639-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2825297E431
	for <lists+linux-input@lfdr.de>; Mon, 23 Sep 2024 01:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87B861F2156D
	for <lists+linux-input@lfdr.de>; Sun, 22 Sep 2024 23:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940E480025;
	Sun, 22 Sep 2024 23:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SC5PvYNE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C435D7711B;
	Sun, 22 Sep 2024 23:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727047422; cv=none; b=gZm9gumr8A6DP/UNrt8sGqLVzZvSrtY4pqoI1XtnICvvbEQl0s7VjHUjPV7R9ZtK9YsG0hKaR5wzokc5U64x+qyb+wIiK/9cEz/P8Atsc/7oWsC/pW2P8xK/U3at45qt8xCXN6LXwYzJbGsNpFPjSWDLm2l925KSILSd+PPqaB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727047422; c=relaxed/simple;
	bh=q7eskfOPt+1rRCtOr6+tX3pkJAaYv+NDxxYgXtTbR9I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uNaghgKHTA7B1c/r6+7MuRRbG2uAvhwv1eyemVLbNryVqn7dloEJWrk9VQvQBinEM+SOCnVrM9NAFK2xV67r44pkjAdtbQaDalPtvmKpzbb5Ct05UfuLhNpz3Y6idcf+aUpaJDKiRanEBPH06ROV4gh7Vr9AAcHQDZu69LYQ0gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SC5PvYNE; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f758f84dfbso28846761fa.0;
        Sun, 22 Sep 2024 16:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727047419; x=1727652219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7eskfOPt+1rRCtOr6+tX3pkJAaYv+NDxxYgXtTbR9I=;
        b=SC5PvYNEJiMVXF92OfoQ8qNgOaV7DWt11Ibk3Cggy/9zGEmpgARnGmBhqiLmYKz83t
         u3voWLIemDWCEYYUxUo79oXene1EQxII/KL6b9RF3bEGAUTLJDta3YCq2bXtR09iq8u+
         Ns1vK5c3GORGpCEmVW5rMCPTKYnCLMEwPIzljSF2Bh1m1PdBpv6jeuRJ0L5E+QcY/jDw
         vEmcOwvopL47IvOMPQA+bOvjl0FAJnvUq/X9iShm/hLE6pNaPwnTDVVL24a6QikzIvzL
         XrDiAZMDqQmWBy4uausRPR0MXrVNBRfnUaOlCvJuc0x0YOhhzclixtoEAe0OxkW0VJSV
         r+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727047419; x=1727652219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7eskfOPt+1rRCtOr6+tX3pkJAaYv+NDxxYgXtTbR9I=;
        b=VN8Cqz16/7VczhKot2EPIn2BEaqrMiU/i9796LNGA7mjZCZGcEVj4tYKd26pW79VuX
         618ANMKUNKDhivzL8eX12FFp/0qyglW9o3rL4+LJhc2YxrQ/kYLkcdFomDTIpyM1n86O
         B0yIORgrDhu+XsTiXgV4U318YmZYNewa9TbbwFWgkvrEa/G6YhMM93SrV3rekOg3BaeJ
         KkwjWt+EMC+Ah30kcoCxxKMkeFLBbvUk3swIuzTeWdraO6aV+BZY5F0jBj/OeqiYDQ9l
         nm/OIy6BYKYpsxdB0Qg27676tN+zuATI4wzEyWFnggtQoT0CYdfpLdrQ22qd4JwEfPAv
         lVMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5XpzQvIyZQ63stCsY2fbAvDNVRinF4OW0E3EEKpkvXOHPdFXozMUoICFCDMBWq8m5leaO6ulQVIGC6tM=@vger.kernel.org, AJvYcCU5hs2Mh/wwNFZxd9YtaYmxXdV/uCBZRb7I38fX5IQkeDIPQNoypvPSHlmvluRrimqECbTS7oMqUR4K@vger.kernel.org, AJvYcCU84EliJ2Yk1hYFZw8m9VZjFVWuw6WBirMD5HGJitzwR3bB3kCr6BrgPkYhG7DKqx3DGJFDYIQtCmQ6@vger.kernel.org, AJvYcCUJE7ISC4coYhKoFaLTzOKqRYGoXtyat+kHwVcriCLFPM0zkPWEKE+ftVc3kWretnZErHPszdbTjonJRvayrw==@vger.kernel.org, AJvYcCW4wWAPkN9CrsaagK395CNTtbplog1+us71R63P+UJWvBsCWU9OAAwVqsZbufaWxBxYgGSjb+t4x5R7@vger.kernel.org, AJvYcCWx/uUtunBpmgNNOc6KI3mitXM07aiaOoxlzSawJX7ffLf4qjcQSPnoiRwmRG3exNyD30WsI+JM6/smgc9m@vger.kernel.org, AJvYcCXsyYZmECsTqI94CgROwjd5XKiQyGjwIDFGl05b8YZ5bUBsWU5qXKSDu/Zc4LqSx//LhCreUtoGzEmx2Ow=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1juVBO8PNEHDGB6z54vS/7+PAlpOt5fufJ/LrXHDzPXLAfzap
	7NyDI2pEG/CUEdAjr5uDzVlPojoP54UisH4g/xgwBTO4sj9kkKVR
X-Google-Smtp-Source: AGHT+IFxxbTsRovcLK/IAIObXStATfMZ7Iuax45veoWqZPyjnMH/P/kvJozSKjZWi/qtWeIKTq4t3w==
X-Received: by 2002:a2e:be9e:0:b0:2f7:cba9:6098 with SMTP id 38308e7fff4ca-2f7cba9614dmr49207831fa.19.1727047418324;
        Sun, 22 Sep 2024 16:23:38 -0700 (PDT)
Received: from foxbook (bgu157.neoplus.adsl.tpnet.pl. [83.28.84.157])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d2e1deesm27117811fa.10.2024.09.22.16.23.33
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 22 Sep 2024 16:23:36 -0700 (PDT)
Date: Mon, 23 Sep 2024 01:23:28 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <mathias.nyman@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
 <alsa-devel@alsa-project.org>, <bgoswami@quicinc.com>,
 <broonie@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
 <devicetree@vger.kernel.org>, <dmitry.torokhov@gmail.com>,
 <gregkh@linuxfoundation.org>, <krzk+dt@kernel.org>, <lgirdwood@gmail.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <mathias.nyman@intel.com>, <perex@perex.cz>,
 <pierre-louis.bossart@linux.intel.com>, <robh@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
Subject: Re: [PATCH v27 01/32] xhci: add helper to stop endpoint and wait
 for completion
Message-ID: <20240923012328.1e4d0bc6@foxbook>
In-Reply-To: <182938da-da86-49a4-800a-446954cc6c60@quicinc.com>
References: <20240913103237.2f5dc796@foxbook>
	<a9dcaa5a-4f5d-451a-93aa-7457798fc243@quicinc.com>
	<20240915095514.6b01fefb@foxbook>
	<182938da-da86-49a4-800a-446954cc6c60@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

> So what I ended up doing was to split off the context error handling
> into a separate helper API, which can be also called for the sync ep
> stop API.=C2=A0 From there, based on say....the helper re queuing the stop
> EP command, it would return a specific value to signify that it has
> done so.=C2=A0 The sync based API will then re-wait for the completion of
> the subsequent stop endpoint command that was queued.

AFAIK retries are only necessary on buggy hardware. I don't see them on
my controllers except for two old ones, both with the same buggy chip.

>=C2=A0In all other context error cases, it'd return the error to the calle=
r,
> and its up to them to handle it accordingly.

For the record, all existing callers end up ignoring this return value.

Honestly, I don't know if improving this function is worth your effort
if it's working for you as-is. There are no users except xhci-sideband
and probably shouldn't be - besides failing to fix stalled endpoints,
this function also does nothing to prevent automatic restart of the EP
when new URBs are submitted through xhci_hcd, so it is mainly relevant
for sideband users who never submit URBs the usual way.

My issue with this function is that it is simply poorly documented what
it is or isn't expected to achieve (both here and in the calling code
in xhci-sideband.c), and the changelog message is wrong to suggest that
the default completion handler will run (unless somewhere there are
patches to make it happen), making it look like this code can do things
that it really cannot do. And this is apparently a public, exported API.

Regards,
Michal

