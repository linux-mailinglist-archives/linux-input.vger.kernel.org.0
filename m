Return-Path: <linux-input+bounces-11557-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0380EA7DC00
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 13:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51BDE1891C6B
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 11:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7872723BCF4;
	Mon,  7 Apr 2025 11:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rc2uAAWO"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEA523C8D1
	for <linux-input@vger.kernel.org>; Mon,  7 Apr 2025 11:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024462; cv=none; b=Qh293CV+APKo9Es4H5wBnoG8taW/UFJslEdwQN9ulq3DCdUbdmWMmzLrfakJWmB/PLCX3APtGWhnWM3grLLagABv0mn3gBeetafB76yEGtDU5hI9VTPpot/TGRxuQMzxOzv/eNujOt91c/GglixC4jzWFUF8Awzqn88skMT0ASo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024462; c=relaxed/simple;
	bh=qTuiJeioKaKZosiK9BS9vDtzBILPWg+qrPP7hog9LKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwrBC7aKx2znOT43DV72HrQmXcf5FTeHF0f/R4EMc17qrZZ5HerIXDGqdViLEZnyEF/Oxo+qX12AH3EwcnwTXkG69VfiBRYCxJ964eaEnrbCTFSRNNM5+eHPB5Mse5r+UPtda0bUzmLN9P5iT48hIryglvELiaa1xp9rRfdZJgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rc2uAAWO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744024459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fPIJPCwsVHSiVU8PU6aQJ87nIHv4vhpCR+ImwGoKaKI=;
	b=Rc2uAAWOW/4zFlIgu+35I2hONnM5PItBPhHHYr9EeNuFRIOrm0L5UTvAS1faHaw8tcH1Ny
	0zNOOBP3hfbAZjhz890OUaajOvSVeST0lzI7q0QUxEQ/XM2UtHLm1Sxwv/H6c8LUyvr2uV
	CnQPd21V0w1XN227swhyArhfmBto6ks=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-3zoyE7XBP4Gcsv6nV3uh_A-1; Mon, 07 Apr 2025 07:14:17 -0400
X-MC-Unique: 3zoyE7XBP4Gcsv6nV3uh_A-1
X-Mimecast-MFC-AGG-ID: 3zoyE7XBP4Gcsv6nV3uh_A_1744024456
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so23648855e9.1
        for <linux-input@vger.kernel.org>; Mon, 07 Apr 2025 04:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744024456; x=1744629256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPIJPCwsVHSiVU8PU6aQJ87nIHv4vhpCR+ImwGoKaKI=;
        b=m5rvVo739zuYxgP8OjgxfXFGq8QmTf0tkBWmvylKm0p1K4DqrKOXhq2fGYudyb6iKB
         CMSAuDKT2q7yLLQmOA+uYBprtJqDy+8Cy/SP1GuIEemclY1559wCXL4mp5XDYwxYC2mF
         ftQqtYfHkey2n5KhXWqfTJJQFP0pXeC+GW9jtgM2OnKaX5P47usG+GmGvXRSERl4GOic
         rPHJIJ4OtCYHvBMbZ0AWI4l7YIouwgaHlez3uqcvWBxmKFR3P6+oR/rq0KZl/AoPx3+l
         PXByMtUybE6qqAu8DAXb7MUbid+opiR3XyPWeRwLrES4x/eDK8f98jaMAdD1Mpo5/JM8
         O52A==
X-Gm-Message-State: AOJu0Ywb+eQTaAN19EstLQqIly8ND4XrKI+DExzc0ZMMWWfnHTcCHx2o
	qNR9rH+tvFLDmtO5zMhvXI5eOE7CJIsKnYAeXB2joWNmj0iN3XUU7xM2sQEdLbyYyQMp4hAyjIh
	hA/cYIbiDtNeQ9kvFr3e18G4DFaemVS64B22ybNqiui8SArhRtCRD/CJHCFz8UDt1bFy3
X-Gm-Gg: ASbGncvZj3yZAGWk5vEBnA0ZASKIqidURCBNSIkGgqsycm67NZZAxZ3lokrFMMIXVeJ
	/tGdECqKKnfzc+h1oqfXk1AkbPqlBS3yJHo/kSsYxvipHL0ANnx5HYJZOZC1EDYwvCRydLTJZa3
	NkfNcyR8+az5u/vRbq5OuQ9i+ecjCeg5yzqZ9iRCdSfBp3yoKI502ji5vPyL/m22qnVGr+J7D4Y
	QCG04rfeRGgC9gR+ZserU/F2Ztygq7AP2rpILf6DO/9t3HP96b73mt7q3uyauNHbkh3JVoaRhWv
	Hp5XW4vT9C0d2nxH23c=
X-Received: by 2002:a05:600c:5841:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43ebeec91b2mr117750545e9.7.1744024455790;
        Mon, 07 Apr 2025 04:14:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSOhNwWO1cnrR7HWQJQnezNiZJ3MtA5xcP3j6016F8pGKyg20fv1R9qcDRkBAL/0ZBYqYFNg==
X-Received: by 2002:a05:600c:5841:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43ebeec91b2mr117750305e9.7.1744024455457;
        Mon, 07 Apr 2025 04:14:15 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c2fe9875dsm11755946f8f.0.2025.04.07.04.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 04:14:14 -0700 (PDT)
Message-ID: <eeb9af77-8a20-42d8-827f-c4eb4e276120@redhat.com>
Date: Mon, 7 Apr 2025 13:14:14 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Progess with GeoPad Tablet
To: Henry Isaac <henry_isaac@live.com>
Cc: linux-input <linux-input@vger.kernel.org>
References: <AM9PR03MB771289673E4CF6FC60244834EDAB2@AM9PR03MB7712.eurprd03.prod.outlook.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <AM9PR03MB771289673E4CF6FC60244834EDAB2@AM9PR03MB7712.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6-Apr-25 20:43, Henry Isaac wrote:
> Hello, 
> 
> I did try this actually, switching back to the correct option in bios and running the command again resulted in a blank one again but I'll double check. 

Ok, that is unfortunate.

So it looks like the kernel may need to manually instantiate
an i2c-client at address 0x5d, while you are leaving the BIOS
option set to "Goodix Touch Device".

Can you switch the BIOS option back to "Goodix Touch Device"
and then collect dmesg output:

sudo dmesg > dmesg.txt

and also please collect dmidecode output:

sudo dmidecode > dmidecode.txt

and then attach both files to you next email.

Regards,

Hans


