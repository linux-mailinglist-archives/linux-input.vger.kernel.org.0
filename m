Return-Path: <linux-input+bounces-122-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBD67EF80F
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 20:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BDBA1F24367
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 19:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C73738DF1;
	Fri, 17 Nov 2023 19:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxeIRAXd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76945D5C;
	Fri, 17 Nov 2023 11:52:11 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4084e49a5e5so20639535e9.3;
        Fri, 17 Nov 2023 11:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700250730; x=1700855530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H72nPbGNF+k6x+gaqimoQnUqxi3F+ArW9AE0eBa2hww=;
        b=kxeIRAXdUQpWFNNhbzFdxaD3z3+8SgJudhJZSGf9HAcATnZOGL600gAdXX7N674Isz
         kJmXIUyT1MYE8j24Kqd0+0tyJsmcgmvOg0vpB/wM5HUt5RJTpeDyEwHC9wuv2KlEqJ13
         VJwoDb0758FsmFpqjXPgW59bzVz6z4YuKAamvrWX1SEGua9jk7I6Xq1XqJPRxTHOMhw1
         dfC9lqIRviXqPykoJncqKXrUSJ0VpyiHVkMCAp0AEjKXXrOYaGpaHY2GEpY3SKcUlixX
         TIxkGfS2G3kfulAXtmmWwD4IcbTRAr94tun0gpnHbgkIkTHuebzSm3Y+nEE6RS33n0Ce
         iA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700250730; x=1700855530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H72nPbGNF+k6x+gaqimoQnUqxi3F+ArW9AE0eBa2hww=;
        b=Mr7y6q44eHhhlI9cLk2yaEaku3NOsB/M1YJUYCqAmk8EmF7yugxUQODizYyrlgqfzZ
         1Vu2+jqROajDGiAQ/XeVRA+Le9TEuzibC9UHplBgvxv5l8hT3LkKFuaFiyEGZvN6okw8
         JQ16+5jlIGhPuL8LrHMAMH9dPR8ZtpOqG1hzWNyJUpcIIGjXjy13JqJj2unOw+A86ncE
         pHvP72KIlEMnXYZMjN/WiTg9eY3/CGFoWbnZDv+02urGdiPmdWt352B+taet3xrAKE6q
         tdxhP764vQ19UUdICCtoQ9cbZL7WIgYFID0XLKbEHevS0tyVUasybQ6qaV6eqWIyHIym
         Gqjw==
X-Gm-Message-State: AOJu0Yz/FO9XoTWGbvU5qO8kwuhyBDr9P6PLuLBLzV/7qa5mgRwA0WCM
	/xbmR8Z6bR6oCCz2UPsOe/ZI7DnvDTJVWyJL
X-Google-Smtp-Source: AGHT+IHhrzahIgmhZQbyz3usaR0We4oOYkpRGHixvhnxoS0NNd3NlGSY7ifUnMUsqYS8xGJBfn3MBg==
X-Received: by 2002:a17:907:6d01:b0:9bd:a73a:7a0d with SMTP id sa1-20020a1709076d0100b009bda73a7a0dmr154948ejc.13.1700250709138;
        Fri, 17 Nov 2023 11:51:49 -0800 (PST)
Received: from [192.168.1.99] ([151.95.113.104])
        by smtp.gmail.com with ESMTPSA id d2-20020a170906640200b0099bd7b26639sm1105282ejm.6.2023.11.17.11.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 11:51:48 -0800 (PST)
Message-ID: <b4356286-368a-49ec-b1f8-d7e5e4afdc25@gmail.com>
Date: Fri, 17 Nov 2023 20:51:47 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] hid-asus: reset the backlight brightness level on
 resume
To: "Luke D. Jones" <luke@ljones.dev>, jikos@kernel.org
Cc: benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231117011556.13067-1-luke@ljones.dev>
Content-Language: en-US, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20231117011556.13067-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> From: Denis Benato <benato.denis96@gmail.com>

I want to express my gratitude toward Luke for his guidance and his help in submitting this fix.

I confirm those patches were sent in my behalf.



