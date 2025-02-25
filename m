Return-Path: <linux-input+bounces-10356-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85277A448CF
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 18:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 404B818821DC
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 17:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15E319992C;
	Tue, 25 Feb 2025 17:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWKuziEk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242AA195B1A;
	Tue, 25 Feb 2025 17:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740505589; cv=none; b=iqDI21pokskZDfos1dmnTpf3DgJZVPTC0j2wJ8zvQMR5J1mDIiCk2s9Gg66ZsF/ycud2/sQs9lOuMx9EcjTyOV7iDvx4seuUcdiVLCqm20CX7OR+QFV0TmqNfCPyMUe8qgAAQXNni2jq3W5Z7vTJidE6igapKGdsgMctoQEk1Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740505589; c=relaxed/simple;
	bh=T9Uc5cIVLJCyLoG2z4c0IrtijF1EOmJkeAs7MRk+yYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUPVcyUpwhkB9jS0WOFXy8xh2QIBBEMDNWrbvGRn7UR9n2UDFk4mqIpZ+xj/wGRNEfn4jWEMO+kbQmCgjJodGoC1T1XYzTUnf7n09dz978SVMc3wzPkLzmgv2HGwYpiQBlkyzNWfUh/tLVlD/nOnzvy9FR6VBlr1o9d/ZJ0R/YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWKuziEk; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22113560c57so35076005ad.2;
        Tue, 25 Feb 2025 09:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740505587; x=1741110387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aevd5kmXRWL3Op1OUxgvpmyGgeb4/9BTmn6NoAzhrl0=;
        b=lWKuziEkF5Kz61iMJDI3rFNRykDP/3sK5zAuagX3Lbgve5cQgNas3cpUmeBBRmmzKF
         lWKhlBMfPp38FMP7UK7072bh96j/hWl6QVF/cz0DIhCKudeXxQEB5Eo24/pf/O+p/6Xe
         mlOKX9Ry0oTPfj/SuFv2gChsrJyCPYsPXZ1G97/LdAzl2Nz6faTPc3EjCBWCtcDbORjH
         NAMH7srv+RiAVlLDi169INEOOrAOzvOvhfFpR8xBQM+h5fcSS1wRES3F3Ehl1pj5aArl
         QeoBvIXlT+liGw4sWn/c+qIZ1KY8QzBhQlXvk6SMi0NDrktxCcCV8PQ45fU+sI2JqzDN
         jsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740505587; x=1741110387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aevd5kmXRWL3Op1OUxgvpmyGgeb4/9BTmn6NoAzhrl0=;
        b=GJD2AHHJOaYSNPMWQs15nyf4WUwLksJXUKtbCIzIYR7QKNr3ebD8XG3wHSRD1eHE28
         p4QBdwctxFat1Hhc0tkRWShxrHQo/mZvUaB7bubdIEWCP5c8hUnY9WbG4mxcsFQwGopp
         6BulH2f9dT/2QE9CpN5k5OYkkOY7pnBSb2EA5jpfLTYTcSFRZmIWRvQhq0LqehWfCB5t
         S31TTy9FNmdhfQiWsfux9VOsxT5w5Cz/Terf1gtr/3EKVB42hgfK8cmvlI1RxFSSzG+c
         O9jAXOv34WwE82QVjqtUe67N2fA0myO70yiVcmHkJuay+BVmpIHyMFzGibxD3ZI0Fv2b
         DXWg==
X-Forwarded-Encrypted: i=1; AJvYcCUdJRtE/fx7Et2ypMFKga0rAr4nT56jbit/ns2xa5kOv2cFkl/01xHwYcDeO04l1EAxF9c80F/+WAfu@vger.kernel.org, AJvYcCVZGD/VB3Fd7RrSTPFXom6yoCu6TVwEZsKfvSd3kz9MxfZ77imTNNd60Jp+3+O0IOWimvgqnV74hv68G3I=@vger.kernel.org, AJvYcCXDkKrRV4neZSvoxgRK8VIZtOhoHPIV0AsLs0TvId1LfBYUkcufWoHSsoLEtL6PiGlOWX+5oli3hXkpV1Ux@vger.kernel.org
X-Gm-Message-State: AOJu0YwFzQvZJXAN4VPdLiuq7rAh4xAf9BFLw51c011LYTL45YZM3GIF
	2o+1h+dp9uwlQbSWDxwiIIiMJLrojOA+jv2DtubxELRuZfN+NoM7LNarcQ==
X-Gm-Gg: ASbGncsewC1gy4keOcuNtjD/wFNlJN+BeVwBDldzAExfklsBHekQtBVgcrA1YtBaAv9
	ZhOl8Ka1Mi3X2SGge30YiMQ+/pFNCnQEonFx5j7pAqJ53aQLUc2jyZrZAJRJkSJK4ZaFM4V0vb1
	u76B8vysc0k6golUsmroEYPWTFRVjXW/ZVoRznTtFcldPhXBzWjWLCTQlQDcTRfWdTN5DHXFPSk
	7o3v9CrGNBj7wlFhQj1FR8pQGELUqd0YOPrfFyJLSgMvhUrAUy6tYR3CzXjQY/KZB1YsZX8SSHI
	w8brymJjTU0r6kLDkPjvwiee7Xw=
X-Google-Smtp-Source: AGHT+IHcKIXFrPDWMBW527uI5ELOW3/yCiTC6hzSRAPUDJ6fDBaYBazF6DCkDedelntRqSgnuilVsQ==
X-Received: by 2002:a17:902:d485:b0:221:87a2:ff9c with SMTP id d9443c01a7336-221a11ab572mr271789545ad.52.1740505587218;
        Tue, 25 Feb 2025 09:46:27 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:987e:29fc:176a:2ed5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb05f7bfsm8926847a91.24.2025.02.25.09.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:46:26 -0800 (PST)
Date: Tue, 25 Feb 2025 09:46:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Markus Burri <markus.burri@mt.com>
Cc: Manuel Traut <manuel.traut@mt.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 7/7] Input: matrix_keypad - detect change during scan
Message-ID: <Z74B8Gppk9YxdIxr@google.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-8-markus.burri@mt.com>
 <Z7YNKl4ljWFQEa-u@mt.com>
 <Z71qEyDVz22j_CvL@google.com>
 <Z72EiqCv_pUZDRdV@Debian-VM-Markus.debian>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z72EiqCv_pUZDRdV@Debian-VM-Markus.debian>

On Tue, Feb 25, 2025 at 09:51:22AM +0100, Markus Burri wrote:
> On Mon, Feb 24, 2025 at 10:58:27PM -0800, Dmitry Torokhov wrote:
> > On Wed, Feb 19, 2025 at 05:56:10PM +0100, Manuel Traut wrote:
> > > On Fri, Jan 10, 2025 at 06:49:06AM +0100, Markus Burri wrote:
> > > > For a setup where the matrix keypad is connected over a slow interface
> > > > (e.g. a gpio-expansion over i2c), the scan can take a longer time to read.
> > > > 
> > > > Interrupts need to be disabled during scan. And therefore changes in this
> > > > period are not detected.
> > > > To improve this situation, scan the matrix again if the row state changed
> > > > during interrupts disabled.
> > > > The rescan is repeated until no change is detected anymore.
> > > 
> > > This is a quirk for a bad hardware design. For 'good' hardware it adds
> > > an additional read_row_state for no need. For even slower connected
> > > GPIOs this will also not help much. However it is obvious that it will
> > > be an improvement for some designs. 
> > > 
> > > Dmitry, would it make sense to make this configurable?
> > 
> > What if we do not disable interrupts after the first one, but record
> > the last interrupt time and rescan if it arrived after work handler
> > started executing?
> > 
> > Thanks.
> 
> I was also thinking about that.
> If we do not disable interrupts we will get a lot of interrupts during scan.
> The scanning process itself generate interrupts because of selecting the columns
> and read row state. Therefore after scan we will not know if the interrupts are
> caused by scanning or a change.

OK, then maybe we should keep re-submitting the work until we get to
stable state? My objection is repeating the scan once does not really
solve the issue....

Thanks.

-- 
Dmitry

