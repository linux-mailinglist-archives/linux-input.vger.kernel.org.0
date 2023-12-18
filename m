Return-Path: <linux-input+bounces-838-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E620E817B3A
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 20:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D274C1C22D9C
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 19:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1841772068;
	Mon, 18 Dec 2023 19:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZPWiKe8I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D6274E20
	for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 19:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c6a71e88cso45656185e9.0
        for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 11:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702928821; x=1703533621; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPtVKu5gwYBjOXrK3/V43LEUFm0g88J5kfDd+XYj2VI=;
        b=ZPWiKe8IU3qoxVQbpY4lBSBfijNU0BZwv+Y2nVpazbZcYsdwcMHy7WvX26mGdciI5U
         tyVVcLlthjaLjvObJSumsfC+QtChbc1FyCXqZBTAhsm6INGCRYWDLI7W4bjWt8fksUeD
         hASrlV9taz/mlm+gR9eY2jP9LkdZ3aPeBO1SLSvotYHM7DoEH085NJFTCVWwZTzltvKH
         v/2D4xuD5uzg3jfXDu2xms3HwSWLZYxsq9fhQXAQtk7rlj1YwBeX+K8K21rXGIBhCa6O
         6hGfQuB1hGbd6UFrm0f+5QnF5jS0i/kkK19BPVLq197Cd1VosUSIMhr47Bo1mwDAT59f
         NYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702928821; x=1703533621;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPtVKu5gwYBjOXrK3/V43LEUFm0g88J5kfDd+XYj2VI=;
        b=csQgjwCRkyexj6UF6T8vClhG9EycciDZj0LNy1GuhiOs8Tzl2TXFzvcfXoqiKZnJ9v
         6I+ibfqOAzRnvUEA5ibHbfEt9aOBWMW9dtPotNERp0L7V1UTnEYsutydiJQOoCfEsdoS
         bs0g4ezUuM/OZZj1xMjzNzo37DdF9TWI65dC4KssgrovJ9PSYoVDUvH+XQMu/b5RqHBd
         zPsoZ9oVDZwYuy0+9NEXXOGeCQRfpxVjUhbiXZageo2Do2ozfSNVqisfzR9KbVXzrtMf
         N1976nqf3r7GQj1R1qiL9Pk+DNiJd+cRGNQYsT+vvAsFbOQq1Dw7HIotKFrxKWPhC/IT
         4+MA==
X-Gm-Message-State: AOJu0YykvHfzPhvt5OapZD098LCYwZWNHrRmTWUHhupYpK3Y3bgx2tnb
	j+S57U7ZoMqL6kZQ1j/mpDte1Q==
X-Google-Smtp-Source: AGHT+IFxJNVDbbFEpZ9qYAtAvapO7qmIyFzoXNzyDMmmavZ2SvLRmZ4My8fsvVSwEH8aV0Tekmx0nA==
X-Received: by 2002:a05:600c:6997:b0:40c:361e:a288 with SMTP id fp23-20020a05600c699700b0040c361ea288mr9537054wmb.149.1702928820764;
        Mon, 18 Dec 2023 11:47:00 -0800 (PST)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id tk7-20020a170907c28700b00a1d1ebc2206sm14486786ejc.72.2023.12.18.11.47.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Dec 2023 11:47:00 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Mon, 18 Dec 2023 20:47:01 +0100 (CET)
To: Sam Lantinga <slouken@libsdl.org>
cc: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, djogorchock@gmail.com, 
    linux-input@vger.kernel.org, benjamin.tissoires@redhat.com, 
    kernel@gpiccoli.net, kernel-dev@igalia.com
Subject: Re: [PATCH] HID: nintendo: Prevent divide-by-zero on code
In-Reply-To: <CACC3sbFGHHONh=orX2+VuRu1SdGXu-jhhFVE-xZe1wOBodUzpQ@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2312182046480.24250@cbobk.fhfr.pm>
References: <20231205211628.993129-1-gpiccoli@igalia.com> <nycvar.YFH.7.76.2312181649360.24250@cbobk.fhfr.pm> <52f54cad-0c0c-f683-f562-4c656b2bdc51@igalia.com> <CACC3sbFGHHONh=orX2+VuRu1SdGXu-jhhFVE-xZe1wOBodUzpQ@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Dec 2023, Sam Lantinga wrote:

> Tested-by: Sam Lantinga <slouken@libsdl.org>

Thanks. Applied to hid.git#for-6.7/upstream-fixes

-- 
Jiri Kosina
SUSE Labs


