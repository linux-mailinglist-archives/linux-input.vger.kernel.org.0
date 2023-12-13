Return-Path: <linux-input+bounces-753-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9551810B31
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 08:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1739D1C20A9A
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 07:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5776817742;
	Wed, 13 Dec 2023 07:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LghiAA73"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD091107
	for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 23:13:45 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-35d725ac060so29182055ab.2
        for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 23:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451625; x=1703056425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NgGIj0DeK/QK4/xMZdof77VgfvY43MJ18Vf8kB8BDo0=;
        b=LghiAA735moAUW8EAevlzz2t9nGXadENA5YAwjHVt2mYDM9K4Tisu2rNoDUHaUntVh
         Mucx3JFDwXCi1bvA1IcHF0MsTYH1gLQu+Og+KM2SJkBWmr5pb6R5LehpJdZbd8EsI69G
         KylbKJsV+xRkrc0KxB1My40XL7tgP5vU606d2Y+81nz3bw+Q+U5nk1Mna0MYDOER8DvU
         fIaUk3QPDmSyr5KSlQPUOJ7Z+OtRGyJCCbmFOWtiP3ol7mwZX4F9CFyUDP/FQoVJDdhr
         Fg3nzLIwtugt81XA9ApSTh6LwEkNtHQO8yLEfLjDukFx0w6YXw5e11eldDAIgqQ9+RHC
         Nb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451625; x=1703056425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgGIj0DeK/QK4/xMZdof77VgfvY43MJ18Vf8kB8BDo0=;
        b=eAt2AjQ8nzJNLvmED3gOmIEhNJ5C+A6/of9daAKHgYlrNGtZicfORDALAN+UuFuIX9
         oGXiJfWymYjfUtsOBU13YKMcdIw0lBFWXmP6VEq4tGW0iMcDgsl99s3xxNcFQ4erKXP9
         tBMKMEpAdNtq/N1pl7OYciCvQFqpFcPyBEIFIDBC6JbvrEeDG5X7gr0HCz7B/NgGcRvG
         5X20HXKLzpIcz4lt5qbYyXAB7q4JIztIzdbZtaVgySj01i0dSYqKqGtp8LNFlnaaIYN6
         c3Iwlv8x/RNDfceIC/dUZsrmertQ7ouxy9ruPkH+X4Fo8FZxf8gnV6BfP0WfqJJXK88D
         v2VA==
X-Gm-Message-State: AOJu0Yyw22JES+XtLe2VBw2EocU6x4EpKh/ESbRJyZXHQYzWA35BxGvH
	Dkid6KG4fmzuDlmZ15ChnQA=
X-Google-Smtp-Source: AGHT+IFeIOmjkUsTf5QYwFADixXuEWdid2BrHj2ViWBtlyLtsxqgDa6h84AWGuZMDSbEtXvGdHdHnQ==
X-Received: by 2002:a05:6e02:1649:b0:35d:59a2:1282 with SMTP id v9-20020a056e02164900b0035d59a21282mr11382728ilu.46.1702451624911;
        Tue, 12 Dec 2023 23:13:44 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:96c1:256f:67e0:c0db])
        by smtp.gmail.com with ESMTPSA id z4-20020a170902ee0400b001cfc44aac0fsm9812821plb.111.2023.12.12.23.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:13:44 -0800 (PST)
Date: Tue, 12 Dec 2023 23:13:42 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 4/4] Input: as5011 - Convert to GPIO descriptor
Message-ID: <ZXlZptEFE3DWyURm@google.com>
References: <20231129-descriptors-input-v1-0-9433162914a3@linaro.org>
 <20231129-descriptors-input-v1-4-9433162914a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129-descriptors-input-v1-4-9433162914a3@linaro.org>

On Wed, Nov 29, 2023 at 02:51:48PM +0100, Linus Walleij wrote:
> This driver does not have any in-tree users but is passing a
> legacy GPIO number through platform data.
> 
> Convert it to use a GPIO descriptor, new users or outoftree
> users can easily be implemented using GPIO descriptor tables
> or software nodes.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry

