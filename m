Return-Path: <linux-input+bounces-629-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E87C80AD17
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 20:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E0D61C20B01
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 19:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554174CB48;
	Fri,  8 Dec 2023 19:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GD8LY9PW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C1E1706
	for <linux-input@vger.kernel.org>; Fri,  8 Dec 2023 11:32:19 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5906c569a1fso997744eaf.1
        for <linux-input@vger.kernel.org>; Fri, 08 Dec 2023 11:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702063939; x=1702668739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o7D4Z/EyGfTuWtFWgsc7kQYg1GqzlSr92oTa3CH9igs=;
        b=GD8LY9PWBMn5vjyl7FxBJ/lhqqDSP+ETbi/2dx0KnvztktvvxXCglQQLtZm53QeJ+x
         oOd1GuVkMoMkMviZDottu3RY7zm9bX2ntmQEkj250+7SuCKyek3tlj6aHbFgLlrcSfQV
         nK9MBvF0XpMtUSY7GlyT9x+wcwxbPv0Z21Nm/Po/PQwMWRSENXUxSLlLnNUCGShDj97p
         sm6AqRwWl+ON9U5WnXGU4tIF3YF/OGuQ3LSP9Pqa0yrzZI5WH/QqwmRilb7u2RVIKN4T
         4tJUBRy+A/u1HodQ/AF0FLgEuwgbVjl6hJiOEVSQd+jPmGjT7Ls/1cdATv5s2fJOFpMh
         jaxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702063939; x=1702668739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7D4Z/EyGfTuWtFWgsc7kQYg1GqzlSr92oTa3CH9igs=;
        b=swq5nWKmPg6n4XJHNl5lui97zW0UPCJNMxrS2377cwKeREd1C4ngcxhECVmW0tqo9Z
         GfPFq1KuvHWsMjo+3U+7Bi2UgyQlN3QwyXU45vfBx1O3S/hEcgPUoWmBRacZ/Gf4hWkx
         oU+Jx4lF0BapHAPjZgNVYvw3F1689qfmGpr/ZuZOluNCBk8iaFqrgt0FCeUo29YrVHag
         RxJXRjYSEy1mHLetHA4hsylE15kWx64HqsbUQqAuRdVZcgYiTtdvtRF3hEabfRzDdXQt
         EjQgGW0fbrobBheXiZIGdy03Dj09vJDyxa2P0F8lOF7MMAK+HHyB7j8JdhpRuq5xwLIn
         tv1w==
X-Gm-Message-State: AOJu0YyLTZ2iT9qlbn1g5rr5H1ND5nICtR0wkUuCtXi6Hai8HvQHxzx6
	1oS++05bcYaJsbNHZdL7UEWY8YRSnLKDLg==
X-Google-Smtp-Source: AGHT+IGo2O5u4U3cGCk308tNd2Y/O+2nTBdKj6UL/avmCPGOfcN1Q4R0BXj8W709T/968a9RdUGeww==
X-Received: by 2002:a05:6820:551:b0:590:8733:bbe2 with SMTP id n17-20020a056820055100b005908733bbe2mr439526ooj.6.1702063938807;
        Fri, 08 Dec 2023 11:32:18 -0800 (PST)
Received: from google.com ([187.144.5.80])
        by smtp.gmail.com with ESMTPSA id g23-20020a4a2517000000b0058abaf23ff8sm409371ooa.3.2023.12.08.11.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 11:32:18 -0800 (PST)
Date: Fri, 8 Dec 2023 19:32:16 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vicki Pfau <vi@endrift.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: uinput - Allow uinput_request_submit wait
 interrupting
Message-ID: <ZXNvQCFxPoH0-i-P@google.com>
References: <20231207063406.556770-1-vi@endrift.com>
 <20231207063406.556770-2-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207063406.556770-2-vi@endrift.com>

Hi Vicki,

On Wed, Dec 06, 2023 at 10:34:05PM -0800, Vicki Pfau wrote:
> Currently, uinput_request_submit will only fail if the request wait times out.
> However, in other places this wait is interruptable, and in this specific
> location it can lead to issues, such as causing system suspend to hang until
> the request times out.

Could you please explain how a sleeping process can cause suspend to
hang?

> Since the timeout is so long, this can cause the
> appearance of a total system freeze. Making the wait interruptable resolves
> this and possibly further issues.

I think you are trying to find a justification too hard and it does not
make sense, however I agree that allowing to kill the process issuing
the request without waiting for the timeout to expire if the other side
is stuck might be desirable.

I think the best way to use wait_for_completion_killable_timeout()
so that stray signals do not disturb userspace, but the processes can
still be terminated.

Thanks.

-- 
Dmitry

