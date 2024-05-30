Return-Path: <linux-input+bounces-3975-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 661D28D56A4
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 01:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94F1E1C243FD
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 23:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3109184114;
	Thu, 30 May 2024 23:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTzrxXUm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481F217B418;
	Thu, 30 May 2024 23:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717113298; cv=none; b=QH7U4yY/jlNI46xJ1MoPhV8jhUXA20CBEXArFyP+g/t0skSZpA8IJuVJeE0g+BFjqNDIfr8xYeZ2bQgcTk0UCSyVodL16d4IL4kYElHaxMmvTISKr5C2sCC/iURzgMX/2kLLIaFvpPT4JwsY7cwozwmw6+2tWIbMVbFvt21l5bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717113298; c=relaxed/simple;
	bh=onedEs9JTQAZKf9mJ+MsRcDXk9sKMqb/zoet+eTrPMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVrlCMAA0+kTYrs5TfIbLvzcJWPvjIVX6ZiEEZ0U/aXgcIEQuWC/N2HAMMzJDK7XC1bPxZK57QVKIQJfC+V4nMzxBPEuc5l8t0G9R1RfKXEbtnR0hp0gxxwhQW4QVT/rEo25FoGQdqkZ2N1mcwe1JuWuzNoeVBglHHApa5fnnIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTzrxXUm; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-62a088f80f6so14834437b3.0;
        Thu, 30 May 2024 16:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717113296; x=1717718096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rLNcKWtNw/xGkzElAEHLfh1R3F7RAJzL+p0JmFeEhiE=;
        b=NTzrxXUmrtWJ8S82rh56PcLh17RAhCVWmFf1MNmGfA1scmR6JPyaXMhXt0nQN+MuUJ
         LD2vG75kuHk09o8d89nk2P5HnS448ACYwbKpaeb3S8XsM1p4J1F1RZK+QcXrNp2v4aae
         vVkPPZfw4W4V1/7T4DiR3s2tjL/rP/dHqv99d3ofV3PhH4R8EE6Ed9vI4/ur4Pe0HnNv
         Uh9b2DRm6jI9O0Nc3crDMj9eGXPJ/QGDMoaC8sTNpKP+qYfv0ax3wDKMcUwQHr0UX1uC
         m0bjzhrJSErk8z0SGyz+gE1CWmSv3FiiTMgb0dUHGj9VbT4iZwvp6YqkMrBgw0Hncvso
         RDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717113296; x=1717718096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLNcKWtNw/xGkzElAEHLfh1R3F7RAJzL+p0JmFeEhiE=;
        b=wn0HHRqPSamw7U4BGSbcZpz1LNYydUd2H4Zt5bmSWgbLjgjquxZ0+LqrL4eJOH+J58
         wLL/oxqSors92mtqfntjpWYXqVqrW8EB+wWsqKFgTIcEaW1FenTTr+oNkfLwoEBK3HAI
         cXTpfvA2zavqcMyVmWCPSVWoSl8E61ewKjvA+DKE/VOukTdtVDF2TsdqNNESukxQLhdp
         pqnmW7GxDYEcU4KFKo4efRUc1WVcH1BjiCtIUsVQiELz1ZucWayrmSbiDVrvV90CmQG+
         7Cwbv4DF8Kk1c0NafzHZK1Zcht7ok6OWtbZbxooEhrSEvyY8fnydaxkRXLTSNMpfm0ft
         EWDw==
X-Forwarded-Encrypted: i=1; AJvYcCVVlG7E4PTgGT54wYMpwaZDFu8DAATfquVzrVid/TjYJZnM6ZUzwZo/6exGFIY31h11Uol26l2o+1sWp3xxUecMypdZ6+iHBdMVsn6CN1I/edSfUR7/1dyFpSW0TjcVoTGiWWhsyudkS8lm6cZqcTW9
X-Gm-Message-State: AOJu0YzPCdjoQjQO0PgyClzN+RKdB7NXR64K8B/2xj8hIeqZzhSBlfiD
	FX84V1JWFeSw0A9yd75vvTjIHPMa23QKawpT76cUSiHN5eOAaSPD
X-Google-Smtp-Source: AGHT+IG8ORHpGN+AhT5iR5KENJxUAzvlFOl0tWgiTBqt3G4l7DXSkTdA4PSlpUNfNm1L/9W3Z4KpSg==
X-Received: by 2002:a81:ae4e:0:b0:61e:eec:ec5d with SMTP id 00721157ae682-62c787a64e5mr3570557b3.5.1717113296017;
        Thu, 30 May 2024 16:54:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:509f:4b2e:3586:eb1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c766132e2sm1390507b3.72.2024.05.30.16.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 16:54:55 -0700 (PDT)
Date: Thu, 30 May 2024 16:54:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: silead - Always support 10 fingers
Message-ID: <ZlkRzbF_T8vgzxcr@google.com>
References: <20240525193854.39130-1-hdegoede@redhat.com>
 <ZlK4ar5rnqW7F_4e@google.com>
 <9103e7ae-70f4-4ca0-a18d-322bdedbbdba@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9103e7ae-70f4-4ca0-a18d-322bdedbbdba@redhat.com>

On Mon, May 27, 2024 at 09:46:54AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 5/26/24 6:19 AM, Dmitry Torokhov wrote:
> > On Sat, May 25, 2024 at 09:38:52PM +0200, Hans de Goede wrote:
> >> Hi all,
> >>
> >> The first patch in this series stops making the maximum number of supported
> >> fingers in silead_ts configurable, replacing this with simply hardcoding it
> >> to 10.
> >>
> >> The main reason for doing so is to avoid the need to have a boiler-plate
> >> "silead,max-fingers=10" property in each silead touchscreen config.
> >> The second patch removes this boilerplate from all silead touchscreen
> >> configs in touchscreen_dmi.c .
> >>
> >> Dmitry, since touchscreen_dmi.c sees regular updates I believe it is
> >> best to merge the 2 patches separately. As long as I know that patch 1/2
> >> is queued for merging for say 6.11 then I can merge patch 2/2 independently
> >> for the same cycle.
> > 
> > Why don't you merge both of them with my ack for the silead.c?
> 
> That works for me too, thanks.
> 
> One challenge here is that I typically send out new touchscreen_dmi
> entries as fixes. Are you ok with merging the silead change as a fix
> too ?

Sorry, I am not sure what you mean here. Do you mean you do not want to
wait for the next merge window and send it earlier? If so I'm fine with
it.

Thanks.

-- 
Dmitry

