Return-Path: <linux-input+bounces-5696-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D2E957A64
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 02:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39F70283D05
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 00:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4E5A50;
	Tue, 20 Aug 2024 00:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPAfekJG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE78629;
	Tue, 20 Aug 2024 00:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724113316; cv=none; b=Lusq4y8H/uMJ3Y311p/GrMhg+4jZ4QMhietkRWpSvkgfvBtAQEmZrY0AuXxDc+0TgQeX/1MZkqIuAGCssZ496rj4nj0yVmFuUQRGX7UOlvkMYUQUtaHBE8f4Qc8RytAtoCcDuSpMkrc64gRpVc4aphL50f+0fn5Q+rHbZ9QiUZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724113316; c=relaxed/simple;
	bh=xz3Bb9Nv/LFmyBfR64mxIjHq9Sqflfx7qlRtwXuH5RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iAFsHUu027OsbHjwZkOD48fQ+vioKnK+5M73m+aygHDWWQGbT1lTRRxjNR61J95eJlg3/jLGqQNztZ7HuKoidHKEI3bPlvvy8jSoFWfmxSWdJfF94f8Gx0nxa5tQqpJ4W6UkaNuqDZdbZyy8+nusI3/sT12Jn3wuk7Jqj3TPBdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPAfekJG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso40066885e9.1;
        Mon, 19 Aug 2024 17:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724113313; x=1724718113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRkYF15CiYdhJNBkO9AQKrLZHndATCxlcRPRtzt+pJs=;
        b=cPAfekJGLUmVuA/dzVELqsbGtze/Ob+razA9hEzjMxBqjn22ke3sG0tS/gQXWJl4/4
         cPnfLFUI/N9esw3wX/SNgd/x+ZO0cGx6xuyYSZUAskd4R5pCI1cEyrLXaVErlBaQGBgz
         Hoo6o0c0q2YabwlPoInSyAuVGUWga4HimC2A5gBLZP09aY18ZQcCAz3uI47B32gHjnio
         eeaQrXVmaklSlLtA3pZ8eAQsND0x7gVkPeFHCW3QSfsRLVuF5DwCpyqdzTqDbD4DpqPp
         C+nQQB1NZeXIemlbnQjn4WfmeFg5ZmLKXj8S1rZf+Z/i+B6b1PS69OWZCqe8hr7+MdHO
         SnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724113313; x=1724718113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRkYF15CiYdhJNBkO9AQKrLZHndATCxlcRPRtzt+pJs=;
        b=pSBly03UPuqTBo8bY0u82GlvtR/srK4a53R5VFl9dz9DWWbFV5WPi4IYwIIs1bXL4J
         A28BdMgbpXAHEIy/2wqYw+Hr/h6YdxHQEUEyF9wKxGietcM63gIXqUyybAMMI2wArlIG
         LezSruSaqaQsrzzbNvZ/dfy6t2t5ml4/KRdI0FxdOat/a0sUmLEAMu+xhpXka55LSWLe
         vYsqai66neOYEhDqwJbQKEjB1f3alOm29F2zy1O10VRG9K9G3eORWzB/jVH+O6t0QxtK
         QlyD4hdeQ7BRezwB0JD/HBj4oOLra2v76oQYFSOewNuCpDwVClVBv3R2zVNTw8Bfy1ma
         bSOA==
X-Forwarded-Encrypted: i=1; AJvYcCVRqkrWJ1vgShuYNUY4J+hvz2TLUWElsp9Lgmx+I+sPHc5m6WEhHzPS6oUWHh74HhN+B/jHkWHz4H9B1nU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvOdbObm9IvbGBinKuirqcBmAPqdK+XkPGtotkIcyBzcP78oCP
	XG1KWAQqNoX6k+Mrly3+9QbOWL6xuUf2rrY2W4A1WRSyeFeycemqxXpYUAKRaS40D+peHXe2uCD
	qSYxegNOs4Fg4lAo+WhUn7a8ofPsxObMA/dQ=
X-Google-Smtp-Source: AGHT+IGj9Pca5hltclj7a7gAZZjT2tMvAhmqMwdO2LTgE+tOrMFjp2aX+udufjBz5qVJe+NsYDLEFtWzX2ZCUzXk04g=
X-Received: by 2002:a05:6000:1112:b0:368:714e:5a5e with SMTP id
 ffacd0b85a97d-3719431764cmr8468722f8f.2.1724113311883; Mon, 19 Aug 2024
 17:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240818231940.34635-5-stuart.a.hayhurst@gmail.com> <bd07e14e-eae8-4264-b275-9efdf635cd82@web.de>
In-Reply-To: <bd07e14e-eae8-4264-b275-9efdf635cd82@web.de>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Tue, 20 Aug 2024 01:21:40 +0100
Message-ID: <CALTg27mgOx3W3WENxFh0sEEeNYKEjrZCEQGoBi9=vjgiaZnZtQ@mail.gmail.com>
Subject: Re: [PATCH v2] HID: corsair-void: Add Corsair Void headset family driver
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> * How do you think about to use the attribute =E2=80=9C__free(kfree)=E2=
=80=9D at more places accordingly?
>  https://elixir.bootlin.com/linux/v6.11-rc4/source/include/linux/slab.h#L=
282

Done, thanks

> * Would you like to reduce scopes for such local variables?

I thought the kernel programming style put the local variables at the
start of the function?

> Can condition checks be merged with the same return value (for less state=
ments)?

Done

> Can such a size determination be explained better?

Well it allocates 3 bytes and immediately fills them, so I'm not sure
what I'd write except stating the obvious.
Unless you mean why it has to be allocated rather than just using the stack=
?

> I suggest to use another local variable for the previous return value
> so that such a reset can be avoided.

Done

> Is there a need to organise device attributes into separate subgroups?

If the driver ends up registering / deregistering the attributes
depending on if it's wired or wireless headset and the headset's
connection state, I'd say so.
Otherwise if the driver sticks with returning -ENODEV, then I don't
see a reason to split them up.

> I propose to omit the explicit initialisation for this local variable.

Done

> Please improve such a size determination.
>
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/coding-style.rst?h=3Dv6.11-rc4#n953

Assuming you just wanted me to use `sizeof(*drvdata)`, done

> Please apply the statement =E2=80=9Creturn 0;=E2=80=9D instead.

Done

> > +/*failed_after_hid_start:
> > +     hid_hw_stop(hid_dev);*/
>
> Please reconsider the need once more also for this information.

Removed it

Thanks,
Stuart

