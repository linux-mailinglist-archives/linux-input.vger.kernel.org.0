Return-Path: <linux-input+bounces-4904-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA2D92A80E
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 19:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 199861F21D39
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 17:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375C714884B;
	Mon,  8 Jul 2024 17:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+RVhwlr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8281487DA;
	Mon,  8 Jul 2024 17:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720458607; cv=none; b=RAGySWek3PFzzd4UBQfyN4tn9nOzhSsZVlbecuTv4uB6lPQAqLdrOBI4XKXHEtlPtJQ33xsKJw0fLHH2CF/Lv6SQ4twr46E9+tywPO+6IsSgUBhJKphsJfc4avbJRVwwd3psZWJu7I+Wv0M+wf8VcAEHsI2KI9gG/t8ked3V0fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720458607; c=relaxed/simple;
	bh=Op6knbIhXxdQJ8+ZAVtWL//DfxBjoZ4YsKg1lxc+kaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6Dg/eGd59z6S79I2GStJJN+RjHYsOY+uWqre76L19FVEMRmK9zjEQO6xm5Wu2NX0Gj+bum3qDDrngAyx2GL0B+2gRcG1IkI16pIZ9oC5wvS9D0SYkikjGW+QimHbzVTir6Vk4dXbB/fY3uA/BSP+5CfgY5HZdcdYxn4+/ObIkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+RVhwlr; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fb0d7e4ee9so27244155ad.3;
        Mon, 08 Jul 2024 10:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720458605; x=1721063405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lk1XJ39RPTUr76awvUXWjDoy5pO66nXYoW3bIHF9m8I=;
        b=i+RVhwlraWOmw4MA3qxJ39LXF/L8AAeHPZYt+vrQX5w0KkVlMT6xRB7c+x78g/2+1I
         MJXgjWl+FDrIVScXm1RyD96nbK+YVcZsJ5pVCoBQqflM9g1eN+G5IkLsvLfWFr9/NqkO
         UEjwsNZUsiP5dK2s5UGy2AcB/EhHRvAezObRBwstIkAbwob5dkMG9akD2aKuTVXdfk6N
         kLpLljWarQd3nyJz8czYTUcmb50DadbKbdamYe5njywO9HfouUwtlU7DkBzGDTOhPXSx
         WowoQ5TOwCYOktF5/SbSpIDREnx6515FI8TxM7Pqrhhpb82tvBNu+i6AzsClbSQZtgrF
         bvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720458605; x=1721063405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lk1XJ39RPTUr76awvUXWjDoy5pO66nXYoW3bIHF9m8I=;
        b=rI1KshZcHcD8zE1EvoNmAFyL13Hpogud90R3GLGupMX3Y6n3uDm39QmIWNdRT+Y97Z
         RN4rhxqhps1d4DnIIxlUYqWqSuCJ2yIUsVF2MgrNAr9jzgaPf0MecsULkSYHxSzVK6F6
         PEIK1mKBqAHZhGS4OP4glZfXCltxu5ZnTMOkYASUAOLVyiqO7YXpbUJKbPF9a1H+Sxxh
         jiRNTtJMRgtdGgYsee7aMH2yS/4hv7ejUpoNMwbrsJ70RmqxAROfS7XJaY/qQpQ07r32
         jsyQBg39CBxIce9SYgdEcE8DAz48oFixlRq9Fh16i0LHFsNcBn0/ye7HZfeuByxfwdrq
         8yXg==
X-Forwarded-Encrypted: i=1; AJvYcCVtZLEbASZf1Z0Uylqlnv1nAjccysp0pmMQQo3j9XjeWRIkkln9lE3FOgwq5vuPsu+oQslzaPb2HWtmdNhFjKFHp5wW032xPL+fMBjIUZg8/aJfAK38vzpn6kV2o9WcUFeWwJp3yGW2
X-Gm-Message-State: AOJu0Yxa0x2211vZIy9zVvdG4Qmx0hhOpo/uSnBuqHIZA1sbMO5ZeeoK
	rBpKQVpl9H0JyovwnWG64RjMJD/VXC0JlqbSiXB/YTkyklfF3ZEo
X-Google-Smtp-Source: AGHT+IHt2KNw+H0l8tRDEhTNIQJ2PAEqgY2EvV92gmMXSTX2UFCqYnYq49jpEQBJlaVVgtOeShRy2g==
X-Received: by 2002:a17:902:ec8a:b0:1f7:2293:1886 with SMTP id d9443c01a7336-1fbb6d2d6b3mr1432925ad.12.1720458605096;
        Mon, 08 Jul 2024 10:10:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d2a4:59f0:2144:2c00])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a2b526sm1049205ad.73.2024.07.08.10.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 10:10:04 -0700 (PDT)
Date: Mon, 8 Jul 2024 10:10:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Raymond Hackley <raymondhackley@protonmail.com>
Cc: linux-kernel@vger.kernel.org, Markuss Broks <markuss.broks@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 0/3] Add support for Imagis IST3038 and clarify the
 usage of protocol_b
Message-ID: <Zowdam9nm4I7FSk3@google.com>
References: <20240613025631.5425-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613025631.5425-1-raymondhackley@protonmail.com>

On Thu, Jun 13, 2024 at 02:56:46AM +0000, Raymond Hackley wrote:
> Imagis IST3038 is another variant of Imagis IST3038 IC, which has
> a different register interface from IST3038C (possibly firmware defined).
> 
> Unlike IST3038C/IST3032C, IST3038 has different registers for commands,
> which means IST3038 doesn't use protocol B.
> Similar to IST3032C and maybe the other variants, IST3038 has touch keys
> support, which provides KEY_APPSELECT and KEY_BACK.
> 
> Add support for IST3038 with touch keys.
> 
> protocol_b is a property, which tells Imagis panel to use a different
> format for coordinates.
> 
> IST30XXC series is known for using protocol B, while the other series
> aren't. Note this could be confusing, unlike the model name implies.
> 
> Adjust the usage of protocol_b to avoid confusion.
> 
> ---
> v2: Sort the compatible enties in alphabetical order.
>     Document the binding before using in the driver.
> 

Applied the lot, thank you.

-- 
Dmitry

