Return-Path: <linux-input+bounces-4486-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920F90FF8F
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 10:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDBB32828FB
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 08:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A852019B3D6;
	Thu, 20 Jun 2024 08:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TImLqYeb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C1F1AC223
	for <linux-input@vger.kernel.org>; Thu, 20 Jun 2024 08:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718873421; cv=none; b=sVYssIPzGnesYz/FfTJ9fmGIbTSVlC68Mm21q0AJB3YYfJgW+LcADVPETou7wALD7wAlKdnmO6eorzr2C1ELzcWeKPoKkQaY4RoWG3YoVdae8yJkQspXitSYs3W4XoL1w/ihpt9+BkZ/lsku0eEe+QNB/8AHilbfpAbZiNRX9Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718873421; c=relaxed/simple;
	bh=wVqLzoefrpt2dNlnt52jRIQtpZoVn3VuJffBSnB1PsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AGCKOUrP6s190Fbqw/Gh87U2d084UjFnUbTBWO1LDeo2D05/e9UIaawKmNgBA8GC/E7JSpN5j8Hu60m2VlzzX1CaW361efArhUiIiYOpMd2EOSxarjcfgA+9yvQG1cQbRfe0IpWA7o+hacShcwbpFXuSyNwbYRHLEDbVzzLACXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TImLqYeb; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57d20d89748so488356a12.0
        for <linux-input@vger.kernel.org>; Thu, 20 Jun 2024 01:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718873418; x=1719478218; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eEs++hRCEHzgL2X1eEeUDV/BXDxwpezqK+Dz1hSZqd8=;
        b=TImLqYebJSG5gaW6A2cGiX5Qq7S2LI/x9/DLqfhyx8vv8FFVrWX0xtDtH52pIlsnmF
         N1qCJCMKZhhHQOV2PC1TnYeagR/V7Jy0g6BGZQJdBlxxuK/1GQhtULrjRV/L1svvObdx
         +u73TLvUHjvhBcnTPrd3jFX01+LIqxs4MIQXCWV+AV1vhVEkIO5T5H5EWSLx2LIZiBxC
         i2TOkvK8glTybAapkPvlTovvup3AWnPOpGZlJq4tPA6B8p59xQuAWDwZnoqFRW+ZJxNB
         cIWeBfQeeECS5TCvnT8c4cDM10tSp1FuCdqYfqMM7ddIvWlg/4Ezc9cyGv0wyTmLKJ5T
         s6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718873418; x=1719478218;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eEs++hRCEHzgL2X1eEeUDV/BXDxwpezqK+Dz1hSZqd8=;
        b=RxJlkUdhWWcQz+7l8gqdLGxRNnzcTILq4gaZqDXLXBRB0PTyY9mQA4z87CJRLLDt1J
         GhXpN+gjG8FpNbnSFbth1TIevEGtPAqcCgYMQ5TfALN6ahcxFyUjT7DlOlX6e2rJd2oH
         lL8+Y1b83W6kiLjto6yAUNw3q4/GvbNOz38IRYy7bfUqehqhNS2ACf58YOeErs0yOP+C
         wM/ZsyeJJ2I5SVZBHEjB1LLVv7k7660tQX0Gu86TEd3QlEKaBgtcugK/lRJRHVOEtj1b
         XKpQ5Pn5aXsJlqYLjuXxjO8hH14IsG7SNI+Z9y+NmM++74GqpEGGI754MZGcf6AParOC
         kOMg==
X-Gm-Message-State: AOJu0YwQkfyMdJNTnTpf7AW9brIuxjN4YaNKUdObPRcKHVZ/aqJwMYlZ
	ojutvEeBC6KC1Qwe1JaCVJgViaXwKV2SpXQjraHS8wk56rWf55++5D6c58ruBymWyVWz9sn4Fz2
	a
X-Google-Smtp-Source: AGHT+IF6iUTkvDJ2rVjiddWHwd0rW/TSIx7wiWB7Utndt2PZEb+cQrdwmlRlxpaJhvoFBUq6eQB1Sg==
X-Received: by 2002:a50:9b54:0:b0:57d:692:33ee with SMTP id 4fb4d7f45d1cf-57d07edd67emr2369172a12.36.1718873418051;
        Thu, 20 Jun 2024 01:50:18 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cf709b49dsm2987011a12.49.2024.06.20.01.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 01:50:17 -0700 (PDT)
Date: Thu, 20 Jun 2024 11:50:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org
Subject: [bug report] HID: bpf: remove tracing HID-BPF capability
Message-ID: <00f7b624-219f-4a05-a7ad-5335f15a41c7@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Benjamin Tissoires,

Commit 4a86220e046d ("HID: bpf: remove tracing HID-BPF capability")
from Jun 8, 2024 (linux-next), leads to the following Smatch static
checker warning:

	drivers/hid/bpf/hid_bpf_dispatch.c:65 dispatch_hid_bpf_device_event()
	error: uninitialized symbol 'ret'.

drivers/hid/bpf/hid_bpf_dispatch.c
    26  dispatch_hid_bpf_device_event(struct hid_device *hdev, enum hid_report_type type, u8 *data,
    27                                u32 *size, int interrupt)
    28  {
    29          struct hid_bpf_ctx_kern ctx_kern = {
    30                  .ctx = {
    31                          .hid = hdev,
    32                          .allocated_size = hdev->bpf.allocated_data,
    33                          .size = *size,
    34                  },
    35                  .data = hdev->bpf.device_data,
    36          };
    37          struct hid_bpf_ops *e;
    38          int ret;
    39  
    40          if (type >= HID_REPORT_TYPES)
    41                  return ERR_PTR(-EINVAL);
    42  
    43          /* no program has been attached yet */
    44          if (!hdev->bpf.device_data)
    45                  return data;
    46  
    47          memset(ctx_kern.data, 0, hdev->bpf.allocated_data);
    48          memcpy(ctx_kern.data, data, *size);
    49  
    50          rcu_read_lock();
    51          list_for_each_entry_rcu(e, &hdev->bpf.prog_list, list) {
    52                  if (e->hid_device_event) {
    53                          ret = e->hid_device_event(&ctx_kern.ctx, type);
    54                          if (ret < 0) {
    55                                  rcu_read_unlock();
    56                                  return ERR_PTR(ret);
    57                          }
    58  
    59                          if (ret)
    60                                  ctx_kern.ctx.retval = ret;
    61                  }

Can all the e->hid_device_event pointers be NULL?

    62          }
    63          rcu_read_unlock();
    64  
    65          if (ret) {
                    ^^^
If so then ret is uninitialized

    66                  if (ret > ctx_kern.ctx.allocated_size)
    67                          return ERR_PTR(-EINVAL);
    68  
    69                  *size = ret;


regards,
dan carpenter

