Return-Path: <linux-input+bounces-3731-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0201F8C8E7A
	for <lists+linux-input@lfdr.de>; Sat, 18 May 2024 01:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD61B283A1D
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2024 23:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD951419A2;
	Fri, 17 May 2024 23:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ElvmhEaO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF5714036E
	for <linux-input@vger.kernel.org>; Fri, 17 May 2024 23:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715988406; cv=none; b=r5AtL5Xup+723Smidcjinl4E5kt5T+gMaJrPudduroH1CQkespyTKUOsyviuml38otTjtnDV2CaT+3YDc94+AipRVdH+T1Eg+ZeIo+zfjLVrHTZTY1vOfe4TPMGnz6gOCrW8naZ9MzW41OoEDjPbwx83n82cG/0c8TFX7Vn5pTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715988406; c=relaxed/simple;
	bh=FY2QEdFM0cTzmcZAB9CNLgD+w9UuXW+H7VPr0lLxhQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFXhCcLEMJW/DwvHRLlgRV+GEilB3dNt1sDxtlPe4qNoNinDPt8JeDTNHtviOJ3GDr2wlnvFqc+pU31LEIPUkb9T2jZ9/6WBacm4GAZa4CwkaRrXiQ3Mwc3R5r1F8uDvnosem6AQtCPVLYecOJNsoDZRu+n0ZCifup4+obcPOnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ElvmhEaO; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ee5235f5c9so24736145ad.2
        for <linux-input@vger.kernel.org>; Fri, 17 May 2024 16:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715988403; x=1716593203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8IZ5BJXL4a/Gxno+DYgdII2wwGlh7k3xDXbAXofV+S8=;
        b=ElvmhEaOXbPoJt4xNKunmU+6kuhOeFynKjUp/QhX2C+eGn15pLBdIildFoOOZNwB5v
         AKJeq7SmX+q+yXzGYb6E/07Xyq+liiiTIzBEuNLZJ+iOsIdAzDQ/H618Gb7RCbFG/Ve2
         PyWpSPYekbM8M5h+2PLVTXXNv/f9l6iD8pmKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715988403; x=1716593203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IZ5BJXL4a/Gxno+DYgdII2wwGlh7k3xDXbAXofV+S8=;
        b=C/dpUpwT9+P1E9Qt9FNgcGvn5JcGMxNUNEAZasgo0Iitf6YI1AikHfp8MlkhYHHp90
         VQTMMV/ci2p4ShOVhDPfUg18BsGo43ZMApTihpEQ6GTYqSt1qBm6FIMe39BuGHDI0gPj
         paZyD/UKj5dFrK8/siCHlzMNKe94WAaH5Rt8cJJY5rqluvbJN7kkV694ErUe61CckqF4
         qufJew59A4heWMTBdJAFn1Jq/eVLHDpGeOMV4Exd/bimwC4WVnSf0RHbo+i7HyiAxvLv
         ttHkbxAULB6FywDgb9Liak50XJsNPt5oXWLqJrhOGVYy8kPyNz9swLe0yI6m/VXQzyyb
         NCLg==
X-Forwarded-Encrypted: i=1; AJvYcCWtvOvUfhn8Hsl1oR8OB+Qzes+HDxNY56W0cQcdz3hyXGZriFMn/BxdFfQVfYl8ZE+wcKBrUgEn71cB4h4wlntIa91j0yUeKXD1b4s=
X-Gm-Message-State: AOJu0YyN582mYxLFTHZo4FxgQ3tDC7MFSrmmFx2hLBGQwIl8g5AqWKU0
	AbvsUOJgPXFyIM7qVf61/pXWa9hRjM4TnnhpINjbmO83u/6iZq3e7yTufYtu2A==
X-Google-Smtp-Source: AGHT+IFN2vF4kwIEwyGx/O2hay1xp/IA0yegEYA49CPtPFkYXixmpwIFQErXw5PB5UqgFuAJphpECA==
X-Received: by 2002:a05:6a00:1819:b0:6f4:8e8c:67f6 with SMTP id d2e1a72fcca58-6f4e03bf3c8mr28122111b3a.33.1715988403203;
        Fri, 17 May 2024 16:26:43 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a6667bsm15222293b3a.36.2024.05.17.16.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 16:26:42 -0700 (PDT)
Date: Fri, 17 May 2024 16:26:41 -0700
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Jiri Kosina <jikos@kernel.org>, Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org, kvm@vger.kernel.org,
	linux-input@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2] selftests: harness: remove unneeded
 __constructor_order_last()
Message-ID: <202405171621.A178606D8@keescook>
References: <20240517114506.1259203-1-masahiroy@kernel.org>
 <20240517114506.1259203-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517114506.1259203-2-masahiroy@kernel.org>

On Fri, May 17, 2024 at 08:45:05PM +0900, Masahiro Yamada wrote:
> __constructor_order_last() is unneeded.
> 
> If __constructor_order_last() is not called on reverse-order systems,
> __constructor_order will remain 0 instead of being set to
> _CONSTRUCTOR_ORDER_BACKWARD (= -1).
> 
> __LIST_APPEND() will still take the 'else' branch, so there is no
> difference in the behavior.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  .../selftests/drivers/s390x/uvdevice/test_uvdevice.c   |  6 ------
>  tools/testing/selftests/hid/hid_bpf.c                  |  6 ------
>  tools/testing/selftests/kselftest_harness.h            | 10 +---------
>  tools/testing/selftests/rtc/rtctest.c                  |  7 -------
>  4 files changed, 1 insertion(+), 28 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/s390x/uvdevice/test_uvdevice.c b/tools/testing/selftests/drivers/s390x/uvdevice/test_uvdevice.c
> index ea0cdc37b44f..7ee7492138c6 100644
> --- a/tools/testing/selftests/drivers/s390x/uvdevice/test_uvdevice.c
> +++ b/tools/testing/selftests/drivers/s390x/uvdevice/test_uvdevice.c
> @@ -257,12 +257,6 @@ TEST_F(attest_fixture, att_inval_addr)
>  	att_inval_addr_test(&self->uvio_attest.meas_addr, _metadata, self);
>  }
>  
> -static void __attribute__((constructor)) __constructor_order_last(void)
> -{
> -	if (!__constructor_order)
> -		__constructor_order = _CONSTRUCTOR_ORDER_BACKWARD;
> -}
> -
>  int main(int argc, char **argv)
>  {
>  	int fd = open(UV_PATH, O_ACCMODE);
> diff --git a/tools/testing/selftests/hid/hid_bpf.c b/tools/testing/selftests/hid/hid_bpf.c
> index 2cf96f818f25..f47feef2aced 100644
> --- a/tools/testing/selftests/hid/hid_bpf.c
> +++ b/tools/testing/selftests/hid/hid_bpf.c
> @@ -853,12 +853,6 @@ static int libbpf_print_fn(enum libbpf_print_level level,
>  	return 0;
>  }
>  
> -static void __attribute__((constructor)) __constructor_order_last(void)
> -{
> -	if (!__constructor_order)
> -		__constructor_order = _CONSTRUCTOR_ORDER_BACKWARD;
> -}
> -
>  int main(int argc, char **argv)
>  {
>  	/* Use libbpf 1.0 API mode */
> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index ba3ddeda24bf..60c1cf5b0f0d 100644
> --- a/tools/testing/selftests/kselftest_harness.h
> +++ b/tools/testing/selftests/kselftest_harness.h
> @@ -444,12 +444,6 @@
>   * Use once to append a main() to the test file.
>   */
>  #define TEST_HARNESS_MAIN \
> -	static void __attribute__((constructor)) \
> -	__constructor_order_last(void) \
> -	{ \
> -		if (!__constructor_order) \
> -			__constructor_order = _CONSTRUCTOR_ORDER_BACKWARD; \
> -	} \
>  	int main(int argc, char **argv) { \
>  		return test_harness_run(argc, argv); \
>  	}

This won't work. All constructors are executed, so we have to figure
out which is run _first_. Switching this to a boolean means we gain no
information about ordering: it'll always be set to "true". We need to
detect which constructor sets it first so that we can walk the lists
(that are built via all the constructors in between) in the correct
order.

> @@ -846,7 +840,6 @@ static struct __fixture_metadata *__fixture_list = &_fixture_global;
>  static int __constructor_order;
>  
>  #define _CONSTRUCTOR_ORDER_FORWARD   1
> -#define _CONSTRUCTOR_ORDER_BACKWARD -1
>  
>  static inline void __register_fixture(struct __fixture_metadata *f)
>  {
> @@ -1272,8 +1265,7 @@ static int test_harness_run(int argc, char **argv)
>  
>  static void __attribute__((constructor)) __constructor_order_first(void)
>  {
> -	if (!__constructor_order)
> -		__constructor_order = _CONSTRUCTOR_ORDER_FORWARD;
> +	__constructor_order = _CONSTRUCTOR_ORDER_FORWARD;
>  }
>  
>  #endif  /* __KSELFTEST_HARNESS_H */
> diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
> index 63ce02d1d5cc..9647b14b47c5 100644
> --- a/tools/testing/selftests/rtc/rtctest.c
> +++ b/tools/testing/selftests/rtc/rtctest.c
> @@ -410,13 +410,6 @@ TEST_F_TIMEOUT(rtc, alarm_wkalm_set_minute, 65) {
>  	ASSERT_EQ(new, secs);
>  }
>  
> -static void __attribute__((constructor))
> -__constructor_order_last(void)
> -{
> -	if (!__constructor_order)
> -		__constructor_order = _CONSTRUCTOR_ORDER_BACKWARD;
> -}
> -
>  int main(int argc, char **argv)
>  {
>  	switch (argc) {

A better question is why these tests are open-coding the execution of
"main"...

-- 
Kees Cook

