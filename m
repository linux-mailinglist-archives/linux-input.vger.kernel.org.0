Return-Path: <linux-input+bounces-3773-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A348CC574
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 19:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA2AE1C21064
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 17:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29050824BD;
	Wed, 22 May 2024 17:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Da994A+j"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9229770E4
	for <linux-input@vger.kernel.org>; Wed, 22 May 2024 17:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716398617; cv=none; b=I3+J3yRvTWVGVu9HMzLjyROCUogdcSY3oVzdVWW9/GsQUGGEMp1FusNpcjT/OyK+JY84rKzpctePYJJwfbHtyocuhVe0BWeEvCHweOx8TBO0l5XA19r1OF548G84Xs/DagjoAqZnbqXRdHz7PfJBtQFSw7ZmBOgkXAkfgFkLBsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716398617; c=relaxed/simple;
	bh=o0IGIDYKUQ1EQY6xhhncbTthOJYll5bMpGIgOHOZzPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hckCLCpAkJa0i7lFV3QH9b0cBdXoby2nwPmb56DlP6ucpbmGPgl3WpslebRT8kd8juhPocLJpamIFAJozcA/xDqfobuQcIWGol95XDUw/FYpU2Ptvl19WCsjmQXgQhDWBWJlGbmWmgPeLZYmeYpHoRSFNG7YQ4hHJppFbNM28u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Da994A+j; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ee12baa01cso12224745ad.0
        for <linux-input@vger.kernel.org>; Wed, 22 May 2024 10:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716398615; x=1717003415; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R4EL7xqZjGCRiT3I+tMMKMve3s1F08ThkcT8ub+E4E0=;
        b=Da994A+jFcFUe4/wah/e13iF6pUiaCuMEBSD09O7UaaP9C+Yco1ylKvJKagrBdWTQ9
         PnX4gG/S+6r7COS4BaERVaaP2nn1TYb5XQdEFFivNMRiuQJlgI3+6aekutwS5YDxGJAS
         jIvy6upbh4jBAYmHL/brkhFFnseeRPBTvrb4fN4P5aJ+NBIljH3wsepSOyhHCZ6cSlzp
         MxqsTiqW96+gjjfFzzeGX9PGMShRBCK5GEBfy6ZcSA/M8pswzHmg3jLFCyq23CgHo2+Y
         Oiw8+P94K4ceLrvMiXZ7PRE9FCJxNEqSFstl979wESiX2Q9UlYAn3mRfuX0g4pGGXvzR
         vM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716398615; x=1717003415;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4EL7xqZjGCRiT3I+tMMKMve3s1F08ThkcT8ub+E4E0=;
        b=XS71uyoJaa8qVoqeNQc5wlv3CtGXGe0SQDXlRNKhFGzvW4CcU98OefVxMMTLQuncpy
         oFyNdqMknFsOBzLh9FxO3C1RZTnO9E0zOPmRtdneQUHROXCoWmJwxctiQOXqw9IjwwYL
         IfBvQLBhselUZkyC7qPe+UKgpMsrXX0LQSKoahNn6WfFWn3QT+sgdxxgAKwVCSB3a6NO
         SUe86VX0D/3CZrt9LrnLixelAo3vrEhZ8GOFW+EtBs2Mjbqml9Rq3+hZnK8+kmOwlwng
         3lWaIrY2Z7TOzSTGaLksW+dGfj+MIOM8bG8aSa4jhX5qU4CyUvrVupMQQRHGj6R2nLU/
         squA==
X-Gm-Message-State: AOJu0Yznq2Rvha+HeSomGRmIAkvozJkuRUntQ/vOPcfrhm4mla+dkc0z
	I2qZNOKpdSDLyv+3QQmq1jdMkQJoP9w2wdsgj9AdaHydpENF1p0asBTr/A==
X-Google-Smtp-Source: AGHT+IH9Qy79s6Zs573kB3OtQn/rYRTyckZo7b/Kybbeorw5pl1eJSPzTvkbh1XBYYLa2esBgCGEzg==
X-Received: by 2002:a17:902:7ed0:b0:1f3:38e8:b69a with SMTP id d9443c01a7336-1f338e8ba94mr850345ad.19.1716398614869;
        Wed, 22 May 2024 10:23:34 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d9d8:1fc1:6a1c:984b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30b22sm241536655ad.180.2024.05.22.10.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 10:23:34 -0700 (PDT)
Date: Wed, 22 May 2024 10:23:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ping Cheng <pinglinux@gmail.com>
Cc: linux-input@vger.kernel.org, Aaron Armstrong Skomra <skomra@gmail.com>,
	Jason Gerecke <killertofu@gmail.com>,
	Joshua Dickens <joshua.dickens@wacom.com>,
	Joshua Dickens <Joshua@joshua-dickens.com>
Subject: Re: [PATCH] Input: wacom_w8001: Check for string overflow from
 strscpy calls
Message-ID: <Zk4qE1ij-0lnxjCT@google.com>
References: <20240510234332.139038-1-Joshua@Joshua-Dickens.com>
 <CAF8JNhKKCCwRzUxookmv9VUecT37fR8psoz7uSVBQqDhnYEBgQ@mail.gmail.com>
 <Zkvcs0yg1ltamZPY@google.com>
 <CAF8JNhKqAOvxo3C1SaecaVP0uj4QeYpttybBgq_Jw7n18MLpcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF8JNhKqAOvxo3C1SaecaVP0uj4QeYpttybBgq_Jw7n18MLpcA@mail.gmail.com>

On Mon, May 20, 2024 at 08:55:30PM -0700, Ping Cheng wrote:
> On Mon, May 20, 2024 at 4:28 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> Hi Dmitry,
> 
> > > This fix is the same as [1]. Without checking the return value,
> > > Wolfram's patch [2] fails our downstream build script. I'm adding my
> > > r-b, if it makes any difference ;).
> >
> > Could you please tell me how exactly it makes your build script to fail?
> 
> We got an "unused-result warning". Jason made a temporary workaround
> at https://github.com/linuxwacom/input-wacom/commit/e83a9bb3e48d2d1b52ec709e60f73b9960d568e5.

I do not think strscpy is declared as __must_check. Do you have a repro
for the vanilla kernel build?

> 
> > My concern is that the warnings are not actionable and therefore pretty
> > much worthless.
> 
> The return value tells us which strscpy call(s) didn't have enough space.

Right, and what can be done about it? The driver does not control what
tty is being used for the serial port (and so can't control the prefix
of the 'phys'), we do not extend 'phys' (because it is used very
rarely). The only option is to truncate (which we already do).

So the warnings are not actionable.

Thanks.

-- 
Dmitry

