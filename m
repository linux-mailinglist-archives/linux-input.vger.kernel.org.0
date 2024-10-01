Return-Path: <linux-input+bounces-6943-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CF198BD17
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81A8F28275D
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF531C32E7;
	Tue,  1 Oct 2024 13:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUSkAjVD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBB21C2330;
	Tue,  1 Oct 2024 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727788315; cv=none; b=S5XoCBiKPiYx2/cavfxvUVn6ko2u/7rB2d6fpWPl6SNr5+xIFEePZWE//xzJtu3wNXzue8s1LgKO1Rznp3NumnMAEcOPtpDt3Ca58LGEX9eObMdHZCM7I2LnlTP1vIVDpIVuYjIiREGS6t/VG/CerslecUKcN18V9pGwwI5OZmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727788315; c=relaxed/simple;
	bh=HNPvJ/PqWbCsyS5/0AcA3xJzXSUbeQO5P1xYtnzYQSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i10nVCjmU+FQidfePeqo5tKAApu/VayzAjrzBWjDLBzGtGyHNa1NL8gs7jxJ36/2TF7HkviaI+1dNF8FoEXarz9tczcTADJHTfUVHg9B+77FYQHE5nTcLsRT+IkqdhOh2CnaEPeL7hCtJNrSxsrX7oc1MlkQ+0Hn1gv28xI3z+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUSkAjVD; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71957eb256bso4975202b3a.3;
        Tue, 01 Oct 2024 06:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727788314; x=1728393114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rKE66rwTZcuv1+y6g8yFmgBe5osyLmX7xYBBBIqfHOM=;
        b=LUSkAjVDS9ZQ9lHq5yw4MzkqlZjvRRS4f7Ocwu7yXLTIdEZboJZRGXbFh+Tkyhw9a0
         /+tBDzyxf4gz5NGYnv07UNd8RczbBmVB6YGHECcQ1i1MgCjjHe6e9WetcvKMetKVBBme
         QuByPQ6OPzqemaYl+xi4mjtqVLNMyMoJHG+vZBj5xZ8eFL9Xmp4qtxpls+3YJVNV+vRb
         /yNSOwD2TaChjD2jQLGI75qHZsKCTXc8Pz4yI8+UU4S/ZctH9IWoxpe181raDNjKkYtu
         KRcNKY1VFdxbLdm4Hh9+SEFXyFacXvMfVhPiwCzBoqusEXJo3+b8Kmsk2rDe6bxZFzsG
         db3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727788314; x=1728393114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKE66rwTZcuv1+y6g8yFmgBe5osyLmX7xYBBBIqfHOM=;
        b=eqR9sgCaDFYSShx1If9CHfVCMsh3yN2Si8uWGZj8GXDCMlAQF2jrVMKv47KEWJwDss
         Q00xD/YW2Yo02XWfEYGGQ+YaSkat7+SDVoyEsLrMEipOdfjNZieKm3UD04oMFAvdM8ZM
         0ktATGoEH64QWr1w5iqXE/7lRy1FLgtZtC/ZT29sVsFXuWHQx2mP482m4HfWXrf1NlLz
         kdR5dYPa5A9Hh5+MpgAWK0dyAEqnC15Ap04/QdcnTmEyl2IkfC9GKSAEs8YX77O859/X
         K4A6hHPE3knWHKDhBxyTLuk0TBt7ueM7exgL1rX1Sl5eV6bOtTMdRCU+kqnLBgvbRiK9
         C8TA==
X-Forwarded-Encrypted: i=1; AJvYcCUe7nV5HW8l8FbIL/ZOVBIs/ByQopFsuJ7Ef3IOmwae37WEgjkAklzsTD/VXvjtf46U0qX58Ebf3qQT1w==@vger.kernel.org, AJvYcCVlPiMHMNmBc9d4TVFelIv6Jw6H3Duo1j6myIkeV3xQUzM+ikVTIhBUZ/l8eYY/XvqOzmP4p8oU3xXfrXcX@vger.kernel.org
X-Gm-Message-State: AOJu0YzVgN+BQ/jOTXEEeBLluNS4AoxXikDMmsRJX6QSiS5xmdal7cuU
	HbRsopGJjSRqnfhKy/GRiHMj/XFOfav1X1YMU+0EAe+tqMlM8urz
X-Google-Smtp-Source: AGHT+IEpmgHuI/o4uxbogaqExfPeG+jRXxqLV+M6Rqvfm5prXpZchS2HdVeaaITvEKfnDnlf4cEvGQ==
X-Received: by 2002:a05:6a00:3c8e:b0:717:8d52:643 with SMTP id d2e1a72fcca58-71b25f39a5amr23538643b3a.11.1727788313478;
        Tue, 01 Oct 2024 06:11:53 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:70a4:8eee:1d3f:e71d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b265181f9sm7946229b3a.133.2024.10.01.06.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 06:11:53 -0700 (PDT)
Date: Tue, 1 Oct 2024 06:11:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] Input: elan_i2c - Wait for initialization after enabling
 regulator supply
Message-ID: <Zvv1FuXBZpjDefb8@google.com>
References: <20241001093815.2481899-1-wenst@chromium.org>
 <ZvvHdlD6E5bzsWwV@google.com>
 <ZvvX5KcKaVBLedD1@finisterre.sirena.org.uk>
 <ZvvyEux8f2ylRQOn@google.com>
 <7db1299f-f925-4689-806f-f1ea4191fd4c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7db1299f-f925-4689-806f-f1ea4191fd4c@sirena.org.uk>

On Tue, Oct 01, 2024 at 02:06:19PM +0100, Mark Brown wrote:
> On Tue, Oct 01, 2024 at 05:58:58AM -0700, Dmitry Torokhov wrote:
> > On Tue, Oct 01, 2024 at 12:07:16PM +0100, Mark Brown wrote:
> 
> > > availalbe when a regulator is turned on?  There's also no difference
> > > between DT and ACPI systems here, both could have the regulator fixed on
> > > and I'd certainly not want to rely on an ACPI system implementing a
> > > device specific delay after power on given the sort of stuff they like
> > > to put into machine specific drivers.
> 
> > Well with Elan in native mode ACPI FW does do proper power sequencing,
> > that is why this commit mentions failures observed on Mediatek devices.
> 
> Yeah, but that's got to get washed through the individual system
> firmwares to get deployed and my confidence in vendors is not high.

I think native Elan is only used in Chromebooks where firmware is
decent, the rest are I2C-HID.

Thanks.

-- 
Dmitry

