Return-Path: <linux-input+bounces-3488-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D658BCEDA
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 15:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E826B20B74
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 13:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171881DFE1;
	Mon,  6 May 2024 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiuREqk6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF8215A5;
	Mon,  6 May 2024 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715001672; cv=none; b=RLRe0c3b8cH2ekt+va5WCb1DkR1ttKaaLFnp4u6e5MUM3jlHzZ2oYFPLRwB0LsxZQPkUxhvFh/bGxzJoN1j+c5VuwgzOojjQcde4uhtoMnAUHEx5CWFO8/cle46me+IqDqqqavjyJYrbSW3eVWlNNNw/jNksofMOnBK3d2wx3Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715001672; c=relaxed/simple;
	bh=ynTZzxoxxo3keo82avsAabxo4oU1Mvhd/Rgmxy+qcWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6wNp+mDG8jLTCpteUU66LzMPxbzU42dvIY63Ni5Cl9UOFjNAienMrEdrjEnANRGwXj7otc6F5L2jAT/C2ivryr6GKSk1LTmyEZ7UkAchzJujfh4H0PlMzSJ5uxll+siemFKTRzsFh88j/1AHTpSLvs5H5axdoVoVhZJ5qOWX4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiuREqk6; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6a0f5afd0a2so2979236d6.1;
        Mon, 06 May 2024 06:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715001669; x=1715606469; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ynTZzxoxxo3keo82avsAabxo4oU1Mvhd/Rgmxy+qcWk=;
        b=TiuREqk6SlcbP7Mkc/GD3k/g1JYlsjNeDhCi2Q71kjKWIcnoHjYXq45Yh+ZvPX1Pq7
         w3t6xoeQglJf78a4K2p9C1OFrlfKg/Gut2s2xt0tccypi7TCpx5CLNrukoQFA5Shaf8V
         U/QTOkpyLh7y16Hul/ml1aYIk0K+ySYpE8PFyDQIHO61XXJwistaKPLkTFn3FxtNbfz1
         HqtCwQddvmsxXqYD18EajDlEJBL6sFPPwmWL/zrdTmvgUN2X/kCXWzNmaxPg5+jWDobe
         bzTKiF9q73urDPkIe8C45Ewp1GnHJveoCB4WRkdD7fUeYeXFAlc4rn6Yw87G7ouUJjQc
         F+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715001669; x=1715606469;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynTZzxoxxo3keo82avsAabxo4oU1Mvhd/Rgmxy+qcWk=;
        b=kcPm45rxjROeRu0Rz/3kRNn6564GhWl1jitROP77w5zjeDdZdGktlw7ro5kytNPX/h
         xA1foCebolWgqALheIN54MaJlLjj1hb7/rhe5XQVM831JJqZM8O/FnydaUC0UytAMXX7
         f1d35ewZb1sx/So156UDOIugNpTr53LuxV03z6+FDslWNMJKV7actZzriYMFvQWhzBUM
         IN3xpHEyvklFN+fiyazVENNCP9KzY8vbUVNd9PrusVod3sWo7r2pA0wvYF1AmoHDMcx9
         Pq2eR0y1jKWeSmrnmIlLSQGnFHubDqTexZrG2wuwsodB4Evm8882nU05i5j64eigMQjG
         cTWw==
X-Forwarded-Encrypted: i=1; AJvYcCXLoUyMdjDQRSOxgvzoTY2ymilP3gQA5M6DGRMEY3bwvW7OLydwpvHug9FcWxwb1L5bNfxu5+m6+i0GMwoOFdlSpLFfvH/47K+0pkExPsrW/ucBkwy28axydM682exAzDf1CjNsda7IgwI=
X-Gm-Message-State: AOJu0YwA3hyr6Y/2DRBzm8zvo7V+7uWAE+oJiWNw/bh5IhCAmeQgW7Zy
	76vp9BVQBBohOEIGyqrb28jE5wBrTKbTziMLvocDZryzjR7dzGJp5tCAs0ENR1FbE2O1Ksc64ic
	vwibvFQcF5lr7EnDI4ibDYHTtA5Zr7IKg
X-Google-Smtp-Source: AGHT+IEwFc7U5/YcMmXDSCiD9wAEX+ogtSyTFxpVI7a3OLB8hYxciop5Lywg0hw32q0z24k1EaIDFAYHhMIPiw7pUjc=
X-Received: by 2002:a05:6214:489:b0:6a0:b3ec:8ff2 with SMTP id
 pt9-20020a056214048900b006a0b3ec8ff2mr12091412qvb.5.1715001669370; Mon, 06
 May 2024 06:21:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506114752.47204-1-charles.goodix@gmail.com> <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com>
In-Reply-To: <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com>
From: Richard Hughes <hughsient@gmail.com>
Date: Mon, 6 May 2024 14:20:57 +0100
Message-ID: <CAD2FfiFv+R=AfAEh-ExU03PzmJz6+kpWAV0b=vVwsUzpUzMSDg@mail.gmail.com>
Subject: Re: [PATCH] Input: goodix-berlin - Add sysfs interface for reading
 and writing touch IC registers
To: Hans de Goede <hdegoede@redhat.com>
Cc: Charles Wang <charles.goodix@gmail.com>, hadess@hadess.net, dmitry.torokhov@gmail.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 May 2024 at 13:03, Hans de Goede <hdegoede@redhat.com> wrote:
> Adding Richard Hughes, fwupd maintainer to the Cc. Richard, do you have
> any input on the suggested method for firmware updating ?

I'm okay with either; it's obviously easier for fwupd to just squirt a
file into a sysfs file to update the firmware, but some devices also
need something a bit more nuanced -- e.g. putting the device into an
update mode, setting the power domains, fallback recovery and stuff
like that.

Richard

