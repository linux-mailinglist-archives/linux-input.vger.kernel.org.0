Return-Path: <linux-input+bounces-5051-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 296E1931FBF
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 06:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54DCD1C20E2F
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 04:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FCB134A9;
	Tue, 16 Jul 2024 04:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwfXK7oC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8029D11C92;
	Tue, 16 Jul 2024 04:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721104871; cv=none; b=fRqVOVTZkEgdCfb5czaDYZj4kONyDqyE2rD/MUFRH87emknqcE696t9n/ImH4oLoP0euFMMOJd42/gtV1dmcEB14VhTqVckQComdCCLQxsOjj6E3bNYFuU9FGIm8/6c9NKNrdB83SoPQ3tId/OJwvbIhBb9/XL0iijDOfXHotpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721104871; c=relaxed/simple;
	bh=hzYmxgDmvsP6hIVfcRVfgcV4s5KlHUL7eoF2AKFvUBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWf2wwusJRrwxHs7wAcePVbVpxxaksyA7sMvwyk9ZB+hODZ14RcQf+dEU81fb+ezNISiGHv96ZtkGfHeycxqbtyQMlpP5dLYn3JX+c0rkyOwwxdLiNtfpvPTUP7DRsuZktuSRryyLJPlGK0MvoqlZVOlApgmomURb1GGIHfkjho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwfXK7oC; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-65f880c56b1so26564457b3.3;
        Mon, 15 Jul 2024 21:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721104869; x=1721709669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oNt0VrlwxxM/+VXkbaJkQD0zqJ7BRglW5s9ByOdVbmI=;
        b=KwfXK7oCrcXnFV5yJuFruK/bc0Zr7Eo7FX36s9DBwSAeVhT1gf7YzrJVUcgAOZtS6A
         JpAPb7CVf/g236JOqfN3pFWdqenaticGkCiv5bcjSpTTfYXEh8d5GfMhYgL50m2LfmjA
         KfHs1j+dcnPBBrnHbcAcjyGNqJHsUzsShLBLU5Csh9DjCFf4uh8+zOHvGouNwnyHXlnb
         N7n7EHxH+vHCmn7fiz1j3v9yN77E3cUNhbO8nRPE1GmO5lGTgWKHDRaDml4+DWnl3wgB
         z5/zdlBG5qN11cuBiRr9ZDJnKlmODMYGECBOLGbeoHy5QJwqRq3VmHO0XIkwE80cWXYU
         StQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721104869; x=1721709669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNt0VrlwxxM/+VXkbaJkQD0zqJ7BRglW5s9ByOdVbmI=;
        b=T2KO2FKZ35gjfD7/7M68wOsvde7oeOxL90vSgRXaFwTTUXUlhTC8K5+KAZw8oJyigg
         ogtDsK51ZYfKHo4UfSD03umP5anHHxLcVYtf5CJGfJxW0O0dWlGOgAhRybfQXMK92oXX
         zKouvy65oxdx9H9sO5cbgJeCAu6oyLStlKOfaoOe6QeziGC1D29dRqwqJqOHumNzfdmg
         jQM01h14fE+2l6CKmHLjIWMTB0Ru3fe8Lx65PhsMUiG8BYS9o63/0JLf4Q+BY5oQOhhG
         f6JEN9KCw9oJRBtCRgcFF8YVSL8yGLRJc5mosBhqQF7F1mNcAGI2nCqagVBBHiHl6MOq
         66lw==
X-Forwarded-Encrypted: i=1; AJvYcCXTG0MOrHx7/W0Joxmo6kl7qwF7G8y/MAFqMgigqiz7RrY5ZuZle6BJZzfQgFkqdZTBzCENNagqnrmM24HgEuPNpjDGdVgNOxCOmrX1ErGsrs0qI45fjg73twAFG1G6Sithi136RrwmCog=
X-Gm-Message-State: AOJu0Yx2/LcWtxCCnDAEQdtY7O14pi92G4ezUEQhLxa0WsnHkcQbj7/C
	xYrcnrNxdtUfZFTA8NaWAMjQw7syYKGRPuGSNQDJ3KkLuA+Wv2gv
X-Google-Smtp-Source: AGHT+IHIec/0an27SOuTNnbL8RmkB+xctdldhSlhKPyModG7vZpxXpaVEpMrnMx+98lqMCN2xUlP8Q==
X-Received: by 2002:a81:b40c:0:b0:650:672e:9c64 with SMTP id 00721157ae682-66380e12b54mr11811167b3.33.1721104869417;
        Mon, 15 Jul 2024 21:41:09 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6d45:d4db:b14d:ea69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e34d2b21fsm3372881a12.47.2024.07.15.21.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 21:41:09 -0700 (PDT)
Date: Mon, 15 Jul 2024 21:41:06 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, jason.hui.liu@nxp.com, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, peng.fan@nxp.com, ping.bai@nxp.com
Subject: Re: [PATCH v2 1/1] input: bbnsm_pwrkey: Fix missed key press after
 suspend
Message-ID: <ZpX54vqOo6RfuVwb@google.com>
References: <20240716000721.3485597-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716000721.3485597-1-Frank.Li@nxp.com>

On Mon, Jul 15, 2024 at 08:07:21PM -0400, Frank Li wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> Report input event directly on wakeup to ensure no press event is missed
> when resuming from suspend.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Acked-by: Jason Liu <jason.hui.liu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

