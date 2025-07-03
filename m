Return-Path: <linux-input+bounces-13360-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21018AF6EBD
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 11:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEE4256044C
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 09:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3D027F012;
	Thu,  3 Jul 2025 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3xIVqQ8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB682367CF;
	Thu,  3 Jul 2025 09:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535121; cv=none; b=pZRDJWXNdH2Al/HGuXW+3ra+lu35HCsSoDDfAIn4IcluP9DPXeJ5C+TVA65+sAJ8/sPVRala5kq4wShCNJKtu6AHhqqozaQL6x8ACrq0+P4xKqULdZG76rOypgf/zKtvLYgH7Q5k11Xws29v8ANdRqHIUMe8pqWeRMwfzD5jDxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535121; c=relaxed/simple;
	bh=ExqD5d6a/XP0/7CJDE4X2XA3FnRIg/4hfc9AdBw2mkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oA+AQk1DkalYajhkougd+r3bRs0oEgfVnlJAko/Qj5xuLN7VTWEuiZAv56/7CV8/iFGDiMD7XG6geyyfb+k0WX5YEL5KmUBA80LDZOx/Ze90Qg5lkrpkJm3L6HcVKeQ4jcqNIz4g28pxkN5ZQjRrW/fzWZ1ZCpwbf1o2+ZE+0XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3xIVqQ8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451d3f72391so56724065e9.3;
        Thu, 03 Jul 2025 02:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751535118; x=1752139918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+IqJtSVOD+e8QSYxAC5vLFloXRl2VFDwWfvOie3ktVs=;
        b=g3xIVqQ8SlzUmqvhIxV77dy7jc/d32G66j3g1D9KKI5BpmxSuwDDA1jA74jtZye7Yn
         R1Q80Pq8tT0jyv2NL/CNFl4KcYbMtNFazseu29Dxn3qAj/LTzdAhv3t5C5aEJhrX0foN
         h4TQwz7e9GTk0fZA5vxhHCQbEpbo+KvQ5NaycDbE/B24HYA3Mhj9xMCWx8KE6k6O9VlV
         iAjstmK5nGiPknpyzFzHENG7R7bf6fBeoxm7uMwnWZkweuGFFUNPSJnDWFPBt60IPShj
         7OiXDB6yRF2Ppfw3ZVXuq/qTyzuybV0MJORLEdIr3AFJfuX06MkinlHtFdPspgXn8Qim
         vd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751535118; x=1752139918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IqJtSVOD+e8QSYxAC5vLFloXRl2VFDwWfvOie3ktVs=;
        b=mw4qF/isOeUgHKUyvqaLszG2vS6qER3kbRjbSx5hFToqwCCAOVKdcIDoelLCUMG6Pb
         +U2YCerDIX7iYvOgFcrRUWJD4AKvs4M2kwXul9bLxTDtlX4ff6FEY+b6Uj6DmICLAlcN
         B0zEEb8xamqYXJb4eowM+2HR/0Uxt26ry/T343mS9UVM72om5Z+RLszYTqBlVgARAkY1
         d280zGZrXxBvTs4qiuQcNjzcNhUSLd7pnlVN4zGJrS1jnBFu69Qw/0c8D3wds/BDti8G
         1Q5QWvn6YeFy43sxM62bnvvS/3ZeGtMIuFXt3o6jBVk1HcWpAuYYvO4z3wbpGu6R4Qpf
         qQjg==
X-Forwarded-Encrypted: i=1; AJvYcCUjwTKjiEaTcb5jAvPLqVsTGoVGRYLuIwNU+b5qB4fGwkGNO+K+VisKVtGo2l3h8gWwCl/cw1KJ@vger.kernel.org, AJvYcCWIGFggmsXtp/C9Gqs3YvdN4Ec3UIaMcNvUOcBWEhT0Md6oJUmMKs7cQb8uJPuNKsCnbV0e9l3u29+iSD2j@vger.kernel.org, AJvYcCWfCViqx0HWricOcLTF9bm8ghtiBhIIjwp4IHIWwlfBwC/sWHst9UM0SCIlNGJXJUu4BR64YJdBAEo7Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygeLww1Gg3q3d+vMc23Qy1ZGaYttQe7RA1Iq6iRXF2zkul1ocE
	/Vc3duRUxLihdm/ngNSMc8zQqilrXo3BdNIwX33wbaiafC+bfK0ek0gG
X-Gm-Gg: ASbGnct6RSu98ssdkmMZSYIjVA7qljosnyvK3jGvEIV5BMGzmDNjMK9GjofXTE6pBKw
	i3cZ+xagV6XxvrtuewITP8wBQOeXdnDD4yfVwzrffdE1brbkhd6llmC50JIgMTVnNF3trB1TS/D
	b5OR76y0LJtmeb2v8Cztyl66QNvPB6TDvw6zukp6L/HS/0OMDPe69z9BEp3DuFBe2IRvG8pVQJT
	Gvs/V4sbBB58Cpz6dZ+C2l9uFCOuypxvmw5YueQqZSmrbDkj+YUJ6PXUH2mBNIZ/g9oL08xllQg
	Nv4c62rLQ86uyOOepnJbeGLDHE9r2yA0t7OPJ6U5Tk3oVtuqVZbS+50KMw==
X-Google-Smtp-Source: AGHT+IHIjp6mGQKcdLydiIk1U6Fe+bPGoowa+9F9nFtc5bMKZ65jj96rrZ6hfhDHiPgCxguK7+TKOw==
X-Received: by 2002:a5d:5e84:0:b0:3b1:3466:6734 with SMTP id ffacd0b85a97d-3b32de6b0f1mr2274454f8f.44.1751535117705;
        Thu, 03 Jul 2025 02:31:57 -0700 (PDT)
Received: from gmail.com ([2a02:c7c:f4f0:900:5d4:bab7:f2ad:ef73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e595c6sm18622605f8f.66.2025.07.03.02.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 02:31:57 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:31:39 +0100
From: Qasim Ijaz <qasdev00@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: bentiss@kernel.org, gargaditya08@live.com, jirislaby@kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] HID: appletb-kbd: fix memory corruption of
 input_handler_list
Message-ID: <aGZN-0aYscZMYpld@gmail.com>
References: <20250627110121.7802-1-qasdev00@gmail.com>
 <qp120s01-q22q-52rr-97n2-or6o30n1qrqq@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qp120s01-q22q-52rr-97n2-or6o30n1qrqq@xreary.bet>

On Thu, Jul 03, 2025 at 09:38:27AM +0200, Jiri Kosina wrote:
> On Fri, 27 Jun 2025, Qasim Ijaz wrote:
> 
> > In appletb_kbd_probe an input handler is initialised and then registered
> > with input core through input_register_handler(). When this happens input
> > core will add the input handler (specifically its node) to the global
> > input_handler_list. The input_handler_list is central to the functionality
> > of input core and is traversed in various places in input core. An example
> > of this is when a new input device is plugged in and gets registered with
> > input core.
> > 
> > The input_handler in probe is allocated as device managed memory. If a
> > probe failure occurs after input_register_handler() the input_handler
> > memory is freed, yet it will remain in the input_handler_list. This
> > effectively means the input_handler_list contains a dangling pointer
> > to data belonging to a freed input handler.
> > 
> > This causes an issue when any other input device is plugged in - in my
> > case I had an old PixArt HP USB optical mouse and I decided to
> > plug it in after a failure occurred after input_register_handler().
> > This lead to the registration of this input device via
> > input_register_device which involves traversing over every handler
> > in the corrupted input_handler_list and calling input_attach_handler(),
> > giving each handler a chance to bind to newly registered device.
> > 
> > The core of this bug is a UAF which causes memory corruption of
> > input_handler_list and to fix it we must ensure the input handler is
> > unregistered from input core, this is done through
> > input_unregister_handler().
> 
> Applied to hid.git#for-6.16/upstream-fixes, thanks!

Thanks Jiri, would it also be possible to apply this one too: 
<https://lore.kernel.org/all/20250624125256.20473-1-qasdev00@gmail.com/>

Its a bug fix I sent before this a while back but I think it may have been buried
deep down in your inbox causing you to miss it.

Thanks,
Qasim
> 
> -- 
> Jiri Kosina
> SUSE Labs
> 

