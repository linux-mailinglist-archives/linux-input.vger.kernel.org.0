Return-Path: <linux-input+bounces-12260-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5BFAB26C7
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 07:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF2791725C2
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 05:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065D2149C6F;
	Sun, 11 May 2025 05:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjD1TorC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8110728682;
	Sun, 11 May 2025 05:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746941478; cv=none; b=kaN7lRLLK2QWeP3BDo8Bhilf4wtv+uE4dvk5H0mul98e9F3GPaAjCXJNTcZ+Xbumz0Hrb7CYIaIoRilmKgvBsxASkaWIx5k4LYcwfLAytcLlkgmY7m9VgikYOW4tVLvSeCvKGMtAxqHxy/fPbfhy/2H2n39PA+jUndEJ7a/N5A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746941478; c=relaxed/simple;
	bh=d//miLxsYdK46hcO8hpWyDpzobyjmIfskI9ta4bRPgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNAS8B3Mqwl2BTMlzHr2Z8tyrL1CvVKPuec0C+dxQ08oBfgvVhGWEjeDqmDs6ihlfQTqtkKP9viLQMyGE0CBPsjAPEwZSalYWFzjBI0NFIyKgWmqtw/ud7Tn9DIgVqzPWgVIosef+kLVq00cz9gvKfbQarlOytl1cFxy5SjbKOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjD1TorC; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso4774223b3a.2;
        Sat, 10 May 2025 22:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746941477; x=1747546277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0AEgFs1Nv4eYPXttTiWzqOYnkKOmm3w2DjtfoMTVxNM=;
        b=VjD1TorCP+/r+apE38xT0xatVrb41k2t1I76n8yG+PcJxtKjOqujYnjNDdNAAa2b9M
         rvpbtr9loCvn3Rx1tb0T66XHjwEqhTd/7151tDpBEbJZvHUqo+m5lfrto0Hojp0NoaIW
         29ujZQi3+5evOtjmWW6ScbBjQSrPZgEygSdHT+juVQL47ZfCFsEY9sNZM3duMfynbqPf
         wpDrRR/Dbc4OWsMRJ1WWMvNIDQjejLzfwJdBhQnUtJcTFJyXDMwcQSzX+Y/10TFzsfGh
         OYj6o+ZcA4GJh0KxlPreSUPpGCK2uTSQ3sbaR0j6O2LxNxOaC5glWQ9Vxgl45pUAv9up
         IR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746941477; x=1747546277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AEgFs1Nv4eYPXttTiWzqOYnkKOmm3w2DjtfoMTVxNM=;
        b=NKuTYiwaBuWkpq0VfEXccNAC4tZQ3mUow/FPFs4tqULx1G3hhF4TRC7nwaUkPHsxay
         +0KbaiZMeiLn34598hvzsnu9Q781eDsrMQHPNphHGV+k9AVWJ4g1QJYSekpTEpQ9bo2T
         dR9sBRZxopvK5nMCB578KbJ250Aj7pi9n47dpT6iob7wWVgWnoV6WOhK7pYBDvQN/mRI
         vF1JqdPilhP4cUE6z2mu5rooIDGXAWRsQXzX8lkrNydqM3m2BcXSqgbeMR7UCiJX4PSA
         RMb49Ad707V+lB8LWhN5UKuj5bUMDlOjP4XEScZolWZZ/bcN5YcN2xRa2LqceyJvjo7c
         J/xA==
X-Forwarded-Encrypted: i=1; AJvYcCU6+Yne1mlJbhL2YVtgOQbUWYrqPjEOkQxTDDYdWJyIQ9v3Ua1B42bGJHhrDFsIJUC4IGNiryGeBa2kPF8=@vger.kernel.org, AJvYcCWEBEY6SBiL7YqTwXdO5Q5vokHicvrAWgyJeMnNIKn+2Z6ZzbjbcbRBGgvhc/gtj1MgE9aZqgar84463ZY6@vger.kernel.org, AJvYcCWlWM4k+vkPCjO1sl+7Opl72cNn8vnCv1koU9/mIhDgHcjdt/n5Y2ldQi8LOmvUphqa+sTk/HhZJH4o@vger.kernel.org
X-Gm-Message-State: AOJu0YwFctTqyDnodp79QPmcGQ0xRy4Qho8DpM0MQ/UM13XZ/RFO2Sq/
	ZdsVYejnbvEOfUmhMu/p/MCHZDJamb9LJsrcYjVVqp5aUkWsaSLu
X-Gm-Gg: ASbGncsyscyG6DrUtK1BMgPi3QOCx0182d6dkbrC++mJZjKFN4C86k+z4toqegvbhgr
	EUX2xHzIolxYLpxlvfoHbDCOJudLu3Du54N2VHFepkbJeAVSd+DBQ9JOm8Sq7+JA/19teuFr6Tb
	+tabNDbel47HdRNBUaBNPh5HvAu4JBk16hl94r9rGfn7tfJhlEemQ8v2gosjc8iw+DQdRetjqsU
	2K+N/C+DRJ9p03sBgtS0ClFg4iTZ/Dy3M2kBVsDNFE44pJUppNwx8vBfSzO7RS80g9o356zNlrd
	vd5SvOT6dBOTPqHRV/AaDgsconTTpiokpHh2b5DAqM9pvEjg0q6v
X-Google-Smtp-Source: AGHT+IEVJ8WdfaI3FOZbUGunTkULlN67Bom5jAh6wSoZcO8l8ojdHk3Z9iUIrv/JKoGKSqkmpAQvWA==
X-Received: by 2002:a05:6a20:12d2:b0:1fd:f8eb:d232 with SMTP id adf61e73a8af0-215abb3fa81mr14692076637.24.1746941476425;
        Sat, 10 May 2025 22:31:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81cd:844c:3bd7:4808])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4ffa91fsm6565075a91.42.2025.05.10.22.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 22:31:15 -0700 (PDT)
Date: Sat, 10 May 2025 22:31:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Support Opensource <support.opensource@diasemi.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Roy Im <roy.im.opensource@diasemi.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 0/2] input: convert dlg,da7280.txt to dt-schema &
 update MAINTAINERS
Message-ID: <kh5les7yznemq6gtvy6wknaazsheejtgmvxu7sfup63xcu6sql@nugenb5u2qfa>
References: <20250306-topic-misc-da7280-convert-v4-0-2972c4e81cb5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-misc-da7280-convert-v4-0-2972c4e81cb5@linaro.org>

On Thu, Mar 06, 2025 at 11:56:18AM +0100, Neil Armstrong wrote:
> Convert the Dialog Semiconductor DA7280 Low Power High-Definition
> Haptic Driver bindings to dt-schema. and update the corresponding
> MAINTAINERS entry.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Applied the lot, thank you.

-- 
Dmitry

