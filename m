Return-Path: <linux-input+bounces-4774-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A491E568
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 18:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8D5A2844F3
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 16:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0323213C908;
	Mon,  1 Jul 2024 16:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbQ14Rnt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40A816CD1E;
	Mon,  1 Jul 2024 16:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719851493; cv=none; b=hM/pKkrEhCn1CjyXI+0Mt2ioq8stPqj11X8MuliZOm5Bfn0MNZZcExyMUzCcSBqdLM24eKunqZ/6EPI6Q3/eAqR1QE40YODBUeoAlyJEbq6fLih8yAiiqPLuKixERaOlini9yR//shBmXgHAmPeFiFAUEf2QcmRm0g3mnIbQpSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719851493; c=relaxed/simple;
	bh=TifkD5hVkfGaSO8ihQ8YTBk0F409tUQni5mnGn4iz8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4S5n0Na+hliU6xiMGnsY5Gk3sWv8xpFZPFxVfVsTS9FtjkrtBBc6uHnuAmTg6GaDN5Q1319+NwPLkunVcOHeonI3JInV0f1I7RIte12b83rRU8UgTOCzGl/75bBHjrwzUP7PYn+cT5Zb1AlwaWbciy09bx7Lj7aHxuHFPefEFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbQ14Rnt; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-706a4a04891so1928926b3a.3;
        Mon, 01 Jul 2024 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719851492; x=1720456292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DDxa8Y7qDFzYu84VzXuiVkhDJnkp6oD4zUKV4rga8Uw=;
        b=dbQ14Rnt5CdSn7PAFYbaiXNEAGCLlgUPsDZjib4X3aEQKWvlC2lcjn7EtjfkdxLmNt
         Gl1fp7Rfgl+omxSgP1eUpz2c7vhEGC4l9CLoE2HPb+xvE9tpAjrNFf7lhWMOGTYyqqhp
         YXm1BGCixPSUjHsoCFwXJqIa0z+pQoRJxvPSL96GmPj+RQUhkRfIXfKE8ZGWqvAppjRF
         3ahlbR7qznynU4QgY1kV8ecTB5UZywa8BubKTDhEGD+vbz3tGfPgHS0tQqGxcX9ndbLK
         XNxKcOXny7+MbJdsCJdImzRwhbI11wchYeW9cc+u0ZhDoIzSUkyhr9GNd5WAKA8ioevm
         3Kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719851492; x=1720456292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDxa8Y7qDFzYu84VzXuiVkhDJnkp6oD4zUKV4rga8Uw=;
        b=TMzA+fJtvojVWbqgwrsrflJzn2PYFUmcggb1IRviD/lxPoV1YeeNZ65TDmp/ndbmOv
         ZFUpQn9WR7BhZcDITjrainxFdISEomaW5I1aOKBGiv++U6q/+DIifxq89S20UZ1Nm21v
         awLdmrvvxdbnKieGEWsBi79jbO1+/XcQYG/CYUdsgvZeeJbvvzyfc3FT1cafPPacYAlX
         aY7IBh6UHKxg3gLCmxVJZ4N71JsoLE4RBY8ZQ9XS2zZT4pupzaGenavsGyUWaA6xYYFG
         W3CMj+Lg0GzzDjkrP2zwgbqCc7Tg8wcrz0TpL15bK6pFpWVtEP7QLgnKuUKosxdhbtB9
         JikA==
X-Forwarded-Encrypted: i=1; AJvYcCXvVbNsAUhy0wUyZgUJHhGd1QPfgrljg2qj/CHWeYFKv8qgvQxNiamyYOvYnEQJVdtA3znDVHF1MXoCg9LIY7J/Finu3pS2rB0bMzGv
X-Gm-Message-State: AOJu0Yw99QCeOjC6Kd7D/TAQmUnTRhZ0T5uAk/lzGmB0uyUhX+0FXJ38
	u8TgtQZlJLtJLiOEaZfenBXO9X0mMdsMPVctJhXdLNlfz6CKFH4bko05LQ==
X-Google-Smtp-Source: AGHT+IG5jVz15PRjp9GhSUvJnrNd+szn4cEnfN2pl4hgvcfqVt6He2l3AUF6hjhr8yBNMH24PhWWqg==
X-Received: by 2002:a05:6a00:3c8b:b0:705:d8b8:682d with SMTP id d2e1a72fcca58-70aaaf2523amr5172462b3a.22.1719851491786;
        Mon, 01 Jul 2024 09:31:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7783:69e6:8487:f6ab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708044ae3a0sm6925981b3a.173.2024.07.01.09.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 09:31:31 -0700 (PDT)
Date: Mon, 1 Jul 2024 09:31:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] Input: simplify event handling logic
Message-ID: <ZoLZ4INw2gZjNzw1@google.com>
References: <20240701060553.869989-1-dmitry.torokhov@gmail.com>
 <20240701060553.869989-4-dmitry.torokhov@gmail.com>
 <qevkkesgw7y2bypexmogght7iozo646vowjkovht5mplegzvnl@tzfffoaglijz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qevkkesgw7y2bypexmogght7iozo646vowjkovht5mplegzvnl@tzfffoaglijz>

On Mon, Jul 01, 2024 at 09:41:22AM +0200, Benjamin Tissoires wrote:
> On Jun 30 2024, Dmitry Torokhov wrote:
> >  /*
> >   * Pass values first through all filters and then, if event has not been
> >   * filtered out, through all open handles. This function is called with
> 
> Nitpick: maybe that comment above input_pass_values() should also be
> amended now that the processing is more straightforward?

I think the comment is still accurate from the higher POV. We do want to
send the event(s) first through all the filters and the remainder is
through the handlers. This is achieved by placing filters at the head of
the list of handles attacher to the device, and placing regular handles
at the tail of the list.

Do you want me to expand the comment?

Thanks.

-- 
Dmitry

