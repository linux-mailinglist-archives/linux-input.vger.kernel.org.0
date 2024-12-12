Return-Path: <linux-input+bounces-8512-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 541A29EE96D
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 15:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E99828112F
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 14:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391A321576F;
	Thu, 12 Dec 2024 14:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DeTuY93G"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942B82135AC
	for <linux-input@vger.kernel.org>; Thu, 12 Dec 2024 14:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734015403; cv=none; b=l0jvR5eQxPx0SN5Iv1tqAKgTmUlGZ34yE8bWcZd1rDSHawyg2gzKdxHKQVmwhFUhq361LgXHIAEp2Y2te0a0Py1T9TqI037B9StyULVN87HmeyivLjU6YAakHUDpG+Q5sV6AXnT2GPz4jPDOl/sWaljLcFKv+eISkwxF8wBz9E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734015403; c=relaxed/simple;
	bh=AjQOAHstwlMlrDDeDDeSx0eAGZcKzvIvjK1+noRizkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQ1OCFVmsI6dShKtV5CrdmaXOCiMSf5rjrqXRl9XaIZGt7ODM2uHME/FffUP+MomT/mOsdHzXtYXMElOqpr3gPwQ/+LfCdgftLOJQvfzCmdTbaGcNMbO6uBSPyWYMI9d8NhTM2bavoV1qbuFb4vuS3+WCusENGQg64mjOU5bOKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DeTuY93G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734015399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oL7oDzf/iu+owBEyFgADY3KtJbecvvlrXRMt6TBS380=;
	b=DeTuY93Gl+QN/i3NSufXohDh5kzQ5U46yxaBzDTGmmFpqioerQwohfCtNBrRf2YVQ/A/vf
	qHL0U/1TkrRuAVqYAU8oYfXmndUGM9+yJUKR7Kv1C++pqgQuajeQMr44mBK3YR/gHRwuZO
	ZEMNOE1WcmHFTmkM2nVLdSgErhzaYbk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-j1Ei60fmMPWJM7sgAmcPMQ-1; Thu, 12 Dec 2024 09:56:38 -0500
X-MC-Unique: j1Ei60fmMPWJM7sgAmcPMQ-1
X-Mimecast-MFC-AGG-ID: j1Ei60fmMPWJM7sgAmcPMQ
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4359206e1e4so7171545e9.2
        for <linux-input@vger.kernel.org>; Thu, 12 Dec 2024 06:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734015397; x=1734620197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oL7oDzf/iu+owBEyFgADY3KtJbecvvlrXRMt6TBS380=;
        b=K6/G3fOpGkkn1/2lO+riXJzgIS1rVuxCzKgVD84rKKMzS6x1SXCvLv5WN9m9ytDHKK
         dPQrApiKNYawMXcFxeDticWfH4xB2eVNVDr4ui6pEyLJPwyvV4OcKwfBGEITI1Dn+4NG
         xrToo5Drx9Z8Sr0E3HyIXNasJfbB92Jui7g80U12ePsHatEyglrHh6nPrJjUXzHeQzqf
         1fEDUyhbj0iWhYdTuHCqE4nwosYTbXFIPaW7l37ic9Vm6S9z1HVCbtPwSHATyCw7/h/J
         +hXYQi6DqAWx0b5Y31z1QdA3b2DVFzS6PWBPJyrFzJgK7atqrcY4zm42hsxlJlgQ+J/K
         sGmw==
X-Forwarded-Encrypted: i=1; AJvYcCXBTrrObxLxCQ/hR5qtQ27furLUr61mtaZDAkmLsJfg4pTnlU+BWKFSulkhGBGKpKaUMMsU7f8b6/Nv7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhSQ8xBIkw751FyeE/WE19CKLoCk1cY1hL3yLHm7FhWWSyqfas
	OlpOIFC8oQhw/DpnYt8NDkf081Pk2OiYP7wnrGrbVdqYkpZAkv6cHTK0WeqAlmFxDh9aA5inUis
	GkXTSf+PnfB6hRaRRqhdM9aejzwt6TTcMTkw+wpf+oy3l9eP6gnq+R6rkDqwm
X-Gm-Gg: ASbGncsOIbxgZh5IJdiUrm1JKSi5RY0k2bLBOAVQXd+UUSr5CSHiUmBkDogb4R2vU54
	6kBV8krDuOdM3DYKGuYT9PcpNr6ZaceRZ0xGCRGPoO8hiMlRKRNILUEJEgf4RPfF6Jt6GT0aAjl
	rcZVCYjBOCtntEhlypNNSpZsj60szIH/ZvV2YkN78qjEmrYWngNZqfJM3Js+1C3mpzZxofBFKu3
	7zw27By68veVmNgCibBlcskfDRCqx2EqvHPNj9gYDQjF6Jdy+RGjY2p6NHvR97nZl4kmZu7YCw8
	HgM5N2g=
X-Received: by 2002:a05:600c:34cc:b0:434:fbe2:4f with SMTP id 5b1f17b1804b1-4361c430b5cmr63303085e9.23.1734015397044;
        Thu, 12 Dec 2024 06:56:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6jT4MvcNP0dxPJ6BKwDHdX4PrfqhYHXR4TAbgRNM6khL6oXpHiVnh7UfEpSYX/vLofOsSxA==
X-Received: by 2002:a05:600c:34cc:b0:434:fbe2:4f with SMTP id 5b1f17b1804b1-4361c430b5cmr63302405e9.23.1734015396688;
        Thu, 12 Dec 2024 06:56:36 -0800 (PST)
Received: from [192.168.88.24] (146-241-48-67.dyn.eolo.it. [146.241.48.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362557c457sm19247805e9.15.2024.12.12.06.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 06:56:36 -0800 (PST)
Message-ID: <8ee0cf91-c215-4015-90fc-32be6f22b7db@redhat.com>
Date: Thu, 12 Dec 2024 15:56:32 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] net/ethernet: Use never-managed version of
 pci_intx()
To: Philipp Stanner <pstanner@redhat.com>, amien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov
 <oakad@yahoo.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rasesh Mody <rmody@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Alex Williamson <alex.williamson@redhat.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Chen Ni <nichen@iscas.ac.cn>,
 Ricky Wu <ricky_wu@realtek.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Breno Leitao <leitao@debian.org>, Thomas Gleixner <tglx@linutronix.de>,
 Kevin Tian <kevin.tian@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yi Liu <yi.l.liu@intel.com>, Kunwu Chan <chentao@kylinos.cn>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Eric Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20241209130632.132074-2-pstanner@redhat.com>
 <20241209130632.132074-5-pstanner@redhat.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241209130632.132074-5-pstanner@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/9/24 14:06, Philipp Stanner wrote:
> pci_intx() is a hybrid function which can sometimes be managed through
> devres. To remove this hybrid nature from pci_intx(), it is necessary to
> port users to either an always-managed or a never-managed version.
> 
> broadcom/bnx2x and brocade/bna enable their PCI-Device with
> pci_enable_device(). Thus, they need the never-managed version.
> 
> Replace pci_intx() with pci_intx_unmanaged().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>


