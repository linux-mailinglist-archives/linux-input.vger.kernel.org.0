Return-Path: <linux-input+bounces-8648-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5874F9F5961
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 23:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC7F51896A47
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 22:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066E61F8AE6;
	Tue, 17 Dec 2024 21:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DT8ho8VJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BB01F7580;
	Tue, 17 Dec 2024 21:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734472798; cv=none; b=qQ0RHTU/65+ZWlbTD0xEhRKUzQvIXw4v4lLleR59DCvALgOZ4ZfqZTzblTae+FDLYcj5XrgpkW+fx/2nPUoHs4DRo1ZwkKEF1w3cbk64SD7GiLu/BuTrMzVKS4/VyvJtTHOb/bIh2NJYShzTygTUv/wUVXPkHjPYiuE0iqZV0fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734472798; c=relaxed/simple;
	bh=EHYD4oZWJmAzUyWanXz1oMro6dFB+kC7qF8uM0EZd/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YX0T1hKv3FvypsKPl5ljmuDPoLBCcpVoqnpuVtUNAlAQRXsO1S+48D8ztY1GCBKbydoC7l/7kW6pvl+3BlbVwlOHAJaEEYSwFrmsXwX+y5fzNjMHDZ6selHhk2RjKhlS7e9zi/I6A3/M2sDr5PeG2foUdiiOnR4Mw4yfFkuflZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DT8ho8VJ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-725dac69699so5104168b3a.0;
        Tue, 17 Dec 2024 13:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734472797; x=1735077597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I6MKIJBHCmwKX7x471bAup/6RTilEf/LujOhbRa33/E=;
        b=DT8ho8VJ+aHdZOGIC4c7mVDwqqbLbkl6FZCXkhxUXhj9KCGomk+jwrK0RG3025ouqK
         9h7DZJSmxty0JwWMKOJUSZlhg7xU7iO3DA+ChI5JWuzS8/akmuJf3L2eTNZlnGTqptO8
         qj6SGbwXa40/N7bbUQ/S2p1IVfLQ0hY5ghKSJRLWrRSXi+V6RU1Q/N05+2oQr4zFhmLE
         PJ+71acKrmojZqKa7imqFCns7mSRyX8MYRyibFwcfxSHMBGVzPmVfcfXKgY1JPP7qNwM
         ML3b2IWU2elJnojvKt/l8pnUgLQLjBeJ/wVy5AMV+qOBV7kgvYJ09nujbbWDo+BJQQ1D
         Tr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734472797; x=1735077597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6MKIJBHCmwKX7x471bAup/6RTilEf/LujOhbRa33/E=;
        b=DhXk3tnWsw3713mXTL4fbDY1pPQsd23btn57Noh3LeVbfZlQ2Nu7pIfDe+iGhz/8wB
         +DNEDEs8zXk3x66aXkFH8urdYllw3yzBSrbNIa2tysOPnS49BxAuBiXlpQkxlRwkmSuE
         es3DgYxkh61ezbaCucrKi+WQVECe46xWxYPb4g22Zo+qof1SLHGHK5TJDq4F2TiBWe43
         tw/I2NodpCfPgU+ZsylcC7zY7bvmhfAPNXQEzqFKJDfi+xJAxRXp7Hs4mLK6SWEFw4wf
         ClU1go9HqUDV+1OZ5hBH2Lp1pfwtiw3uHCJ8orzVfQVZH4x9cirdp84eS1tMW9TjkfxY
         kAcg==
X-Forwarded-Encrypted: i=1; AJvYcCXlYhB+qqxscSt2YsYPh0rRWFVCAICDUDsCBjaeeA3ejT754LQCs7HCjZEDyDxmbNcMiZzw1ezhhBR6Ogs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrgMP88v/u0jJHl8HX3Hw1r6Sef19KHmuWp0kW9nXL+PrEXZ+G
	VfJqPDqpZyJ1jmt8UPw6E/DhhRgSoBAOBlxDo0dC6pDk8l2XUQFN
X-Gm-Gg: ASbGnctBew8lo7AxRwsWm4ns40LlowD2oBXpWtxi0Hbgh0OyGbhhEZQh3f9a8z+hUdW
	b9ny7ZiootwH6/fl6X5IWbPsIX9CmtLEDObTgEiIAtrLMzY/9P4MKK0HhX4O3Z0SBeys5kJvIEW
	1jFwAASUko5fnSA3njGASGwiXdK07DdO7tb91yaw8lXlEDKf0M8zzmgxy/ezANqFWjSEfs01dwo
	3Iwc1JgCt9MTMUESXg/j+co2Hi55VWGXaLMxoWb39QdePHhXkYGrkv6TQ==
X-Google-Smtp-Source: AGHT+IGB1viY6bldpXmzP2I3zwqRqV2auadVhK5phSF2pMr9cn2tziGNdJKobysgcy7u6jExhjazSw==
X-Received: by 2002:a05:6a00:4085:b0:71e:a3:935b with SMTP id d2e1a72fcca58-72a8d2ccaabmr875143b3a.25.1734472796732;
        Tue, 17 Dec 2024 13:59:56 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:55e2:6799:5b4f:83ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5ac8766sm6278091a12.33.2024.12.17.13.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 13:59:56 -0800 (PST)
Date: Tue, 17 Dec 2024 13:59:54 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] Convert input core to use new cleanup facilities
Message-ID: <Z2H0Wszo8jYbccvq@google.com>
References: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107071538.195340-1-dmitry.torokhov@gmail.com>

On Wed, Nov 06, 2024 at 11:15:27PM -0800, Dmitry Torokhov wrote:
> Hi,
> 
> This series converts input core (but not input handlers such as evdev,
> joydev, etc) to use new __free() and guard() cleanup facilities that
> simplify the code and ensure that all resources are released
> appropriately.
> 
> Input handlers will be converted separately later.

Since there were no objections applied for the 6.14 merge window.

Thanks.

-- 
Dmitry

