Return-Path: <linux-input+bounces-4312-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C520990433D
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2024 20:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44408B25702
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2024 18:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A466A5BAF0;
	Tue, 11 Jun 2024 18:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2qfA+12"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBA3482D7;
	Tue, 11 Jun 2024 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718129518; cv=none; b=Q1L5pf/LUBqnQwRBFv22RCreFF3ikFf/svBrG4sbezeqV2zQYDX9+Z2jtlIKACWZAtOF9yzY9eecbNZfhNbhYBWD5hxl/aNHRMNgtSt8iMgjbwHQ9q1vHPtVrZ7uktWRY0hQ1TZNfDl/lrFNRofu7pps21lH5arYz5yYaqitIzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718129518; c=relaxed/simple;
	bh=Wg3BSKO9ze3H/vJA4+FngTXyThJMVk6fPylh5P0KmEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPAZNLWwGa88tesfdOZmlobS0fh48t0JoIQrpThN3hqv6GEGMZTFouQ8jSf0GeKlDFGGc7YkCCM5A+F+fhNFDzbpPRmw/DYiRIw+nX2I+ppENtLY8FoVYSrwq6jC+Zx1MEea8TRN4f/XWp/i9OfqWrnz+04S63xwSsTJJUHung8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2qfA+12; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3758fa1cc8eso5752205ab.3;
        Tue, 11 Jun 2024 11:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718129516; x=1718734316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v2Q7/e2RL6Iylt0JNf4WH+s+kRIK0AByBK4aInpj5Wk=;
        b=Q2qfA+12Alxn70+UtZ4tGwF2UwRKVqQwF42o8w+kP+iNYEnAlqu07o8qqJeckyswcL
         s8p8X1WiZbXSLs6+pV8LI0m3P2zxX/HxxTyz/SeyUOfK2lv6voFbJYl2Nj/DQMhHFInH
         aYuy6fAiw8bazkoHSg170O87Y3/AsB1gRgHMp7emzrhBXlU6/0WZ6D711+PCYnIdTY5P
         fWInZIuOtAFJ4N0DSV5UKmNib8zS6MNj6OMlsZI4Ame4zu79sEzJypz3bBqvdd9yRVSk
         /nE3ZOl2yFzSm4DWNcWDDMtRogqC4ptldAZ2mqsWEhOON9MVetjDzw6/S1/4TY/X86OW
         VKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718129516; x=1718734316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2Q7/e2RL6Iylt0JNf4WH+s+kRIK0AByBK4aInpj5Wk=;
        b=lpSH131KYYedXR9fUUzxX4q0BDlRHe0mr1CpANs3Lxgq2bUPYG8JaInic2k8ARc+iH
         JmMw0EoKOrNQtGWZ5+WsOloc5ov8+ikuat91Y0U5VxP15KLVGDQJIqE5wogL0StaRXXk
         bWHV3aspjCbgQbPslWVIFl5omlVKX421HEg+sPRSbOr3Sx4lOys7wL3eFYm+Dr59XJY/
         tSoFx4NZE2GG6qTnC0ncoTXBukEBU8DswrAPTM5+iSekhfRNtaW5IgdR1+tnt5EZddsj
         Z+qcL1yRUaBBu9LKS6CEUZt187yxK/d5ZWGPLsrZjc6AvazfW7x3xpM2PU6g+DXlVLff
         JBuA==
X-Forwarded-Encrypted: i=1; AJvYcCVVGIpAJmOi+/t/y6QlZ5EKp1Lv/cMe/rMLq600sciJJZbC0p9jpzKKLDK21B8YBmoe7WA+6fW4YbJLfD/C13pA0dTIk87j0o7vllO4WS2v8t8pDjp17pKrQ6qMIcUS09IiypowX8sa44IB7NaUTlDxuSeTBDRfh7xHoThi1RywYGndV+ED
X-Gm-Message-State: AOJu0YyS/AIzU5sY3o3hA1uqiGvnev75rzHj+EPU8R/FR+D2iqXiLXAB
	4bbe1kZb4x69qbVXxR/1jNUlTuct9gkxvKWQi/dXcJe8lE7+vZ2m3Toonw==
X-Google-Smtp-Source: AGHT+IHw3P6f5tmKGmSxzYYgPWvSLMNz4wApyPpb1GXPY82fpYCq2naoiYWVgJSvHA78LgqnOUEcLA==
X-Received: by 2002:a05:6e02:184a:b0:375:9dd4:d693 with SMTP id e9e14a558f8ab-3759dd4d92amr97091195ab.3.1718129516156;
        Tue, 11 Jun 2024 11:11:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d73f:b49c:626c:fac7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6de211c93b0sm8061308a12.27.2024.06.11.11.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 11:11:55 -0700 (PDT)
Date: Tue, 11 Jun 2024 11:11:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daisuke Nojiri <dnojiri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Pavan Holla <pholla@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/3] dt-bindings: cros-ec-keyboard: Add keyboard
 matrix v3.0
Message-ID: <ZmiTaXQd6Y1N3W8X@google.com>
References: <cover.1717779167.git.dnojiri@chromium.org>
 <2fdd4a2cb8526e60ba7143ec868e835f8ba8f55b.1717779167.git.dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fdd4a2cb8526e60ba7143ec868e835f8ba8f55b.1717779167.git.dnojiri@chromium.org>

On Fri, Jun 07, 2024 at 10:02:58AM -0700, Daisuke Nojiri wrote:
> Add support for keyboard matrix version 3.0, which reduces keyboard
> ghosting.

Could you add to the patch description an example of how this should be used?

Thanks.

-- 
Dmitry

