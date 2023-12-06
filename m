Return-Path: <linux-input+bounces-525-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21978806C02
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 11:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BC291C209A8
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 10:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418E32DF7E;
	Wed,  6 Dec 2023 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HR09C4xw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08A91A5
	for <linux-input@vger.kernel.org>; Wed,  6 Dec 2023 02:34:19 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3333fbbeab9so558073f8f.2
        for <linux-input@vger.kernel.org>; Wed, 06 Dec 2023 02:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701858858; x=1702463658; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PkqurgaRmjaLu2pCU3OGXo3U4UmjRqbubj+U5Qx3nMc=;
        b=HR09C4xwCEoHf8vaufFnoRDk1DR/I0kzCToI0Pz7eDVQ1Yxly0Nq7mGuuQjtfivU6N
         DszBuun8BeMj3hm92Ec67SALkaaCFOaynORuZ7lpjCWWA3r/XrJwE/WVTING2XDGF1pg
         LcPpYL93vbTgaNwuyt4u9rGLmZ0exfjlxemi0yHuuu+YOYa0e0HPZ4sd5wU6jZFrvrHu
         Xc6atv1ZfD3PFZAeBtXN2gsdfWHnLFWIeUfIb4gSZSr5lKbBAOJvPap8EYHBbeCYOQWG
         Kbgi2ASJvGFlj3Q1i2XbJn/RAlMaNc4qNbLoDg7Y+HW8tHPCAm5kRpU7RVds+wSuVlsF
         xwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701858858; x=1702463658;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkqurgaRmjaLu2pCU3OGXo3U4UmjRqbubj+U5Qx3nMc=;
        b=XSWmBuu8xq54ahBdP+Cc7cW1cT1DqSAnvC4Z3umjyVaDqvCvIlaYEM4TRWDJj4Y16d
         7gKsHBxPKlIPb68RsU8vaqwVhKNdvUnFEwpB4yZJrbpFtQTza3OY8WRcxknhzFoWvGEq
         rYPIIMDZV6Dqhmc020qbFjcVM4c9rR/p/MDuIY+WFb1tXF2P73cpKIRBHEBQ15ED4oKN
         31wEhzcXmYMi+mu6UPuQaROWr2ssONKGblSKzBQpdq1WroFPN1Yx2kFka+ekWUyZv46+
         gbfnD/oHECiX5pDdfm1hyMCeifDswpGnKPNv5PQISPDgTUiGBoNILrj4wyG6ky9vkzdg
         Etgw==
X-Gm-Message-State: AOJu0YxBjcGbfAh66uf0KbL3xMWwSwzNm/07ijcnZU0NpGSvCrkSkOcO
	QyX7EsNUksAEdOMC0jFtwjBLDA==
X-Google-Smtp-Source: AGHT+IGydOHhQc8hj4pdsRCVfI7xupjllVV2cYAvnk9xvpQfdj1pdTOPuyTtnGm+kybSdb3zkcH1Dg==
X-Received: by 2002:adf:e502:0:b0:333:48d7:f56 with SMTP id j2-20020adfe502000000b0033348d70f56mr346921wrm.49.1701858858376;
        Wed, 06 Dec 2023 02:34:18 -0800 (PST)
Received: from localhost ([193.86.92.180])
        by smtp.gmail.com with ESMTPSA id q3-20020adff783000000b003332febec90sm14589786wrp.7.2023.12.06.02.34.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Dec 2023 02:34:18 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Wed, 6 Dec 2023 11:34:18 +0100 (CET)
To: Tzung-Bi Shih <tzungbi@kernel.org>
cc: Even Xu <even.xu@intel.com>, srinivas.pandruvada@linux.intel.com, 
    bleung@chromium.org, groeck@chromium.org, linux-input@vger.kernel.org, 
    chrome-platform@lists.linux.dev
Subject: Re: [PATCH 4/4] platform: chrome: cros_ec_ishtp: use helper functions
 for connection
In-Reply-To: <ZW_rdCJ7EdtmJYFz@google.com>
Message-ID: <nycvar.YFH.7.76.2312061133470.29220@cbobk.fhfr.pm>
References: <1701741033-26222-1-git-send-email-even.xu@intel.com> <1701741033-26222-5-git-send-email-even.xu@intel.com> <ZW_rdCJ7EdtmJYFz@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Dec 2023, Tzung-Bi Shih wrote:

> On Tue, Dec 05, 2023 at 09:50:33AM +0800, Even Xu wrote:
> > Use helper functions ishtp_cl_establish_connection() and
> > ishtp_cl_destroy_connection() to establish and destroy connection
> > respectively. These functions are used during initialization, reset and
> > deinitialization flows.
> > 
> > No functional changes are expected.
> > 
> > Signed-off-by: Even Xu <even.xu@intel.com>
> > Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> 
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

Thanks.

> One minor suggestion: we usually use "platform/chrome:" instead of
> "platform: chrome:" for the title prefix.

I have changed that, and am taking it together with the rest of the series 
through hid.git#for-6.8/intel-ish.

-- 
Jiri Kosina
SUSE Labs


