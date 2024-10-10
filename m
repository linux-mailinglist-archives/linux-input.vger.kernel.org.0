Return-Path: <linux-input+bounces-7240-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E74D998315
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 12:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD0F92839E7
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 10:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF541B5EBC;
	Thu, 10 Oct 2024 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y8bTd1LP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC0536D
	for <linux-input@vger.kernel.org>; Thu, 10 Oct 2024 10:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728554549; cv=none; b=MhNuB/WWeRfvIK9RfH8d6r5DGpP7Mqq4vQ++8s/NnFhYajw2Y3JhfDrjXYBlU396BIr+rO4fZR6QXTfCsst0zklGI8wwCGBWzP7aRcvsFjRZ1AD+lr8rjkpDKpHE23tgprIn+BsZMGbmck5aJ14Qy9CTAizch42opLd1/uPxleI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728554549; c=relaxed/simple;
	bh=yPFq0ND7kNP0YHeFxCYdN+JTVeMjklsFhy8ROz/79vo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rJoniyFcb/29taNOk7FXD4loA9RzAZpE1lUtSdzuOLLHBonaAS+FG8qMboiANkWFcUOusxx6gtkRo04cLDO3XywGRhNhu1tm54PbLTVvg6Thum0YXFiKzkSgluK89LzqHyNsjh4GAp7pPeOwMYFN6ZxBiaoGm+Mb6GTrVdIHCWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y8bTd1LP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4311695c6c2so4655255e9.1
        for <linux-input@vger.kernel.org>; Thu, 10 Oct 2024 03:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728554546; x=1729159346; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H6DmXM9l7nvKa59MmdQtF4fb30isQWa0EPFQU+RaPl4=;
        b=y8bTd1LPLL6d7BxJiiWOI3+4uTlLY0Ehpbk8x80Gqwd5gmFtbjmm5k/VF9RBXUCZEv
         X2gxQCjwkTU/z/c4LbT/GQEtxl5KDMCDqAPsnQbOE1VhVEKh7fK1zQBsCAOrMN1xcetT
         CjmxAmCgjJgv1PNpIf8Yql7K9LNG3tDQLVV/omne93rf/ZVyc9QGi5TId75Bx6Duzy9e
         Iv3U/yd28aYHmBrgNNQeZ6Il41FXO1oz8FRwP6HXLgw9c7AwPGLF3zoCo+9zV42o5DzS
         Vu7yFCNGpgYR717P/aw25316uFzfEJ1GBuLG40fgEN9C/fJZcLh/ivJZAyVvsQBiqobY
         hH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728554546; x=1729159346;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H6DmXM9l7nvKa59MmdQtF4fb30isQWa0EPFQU+RaPl4=;
        b=U2pzJCZA23SAwas0s7jVESwdZfJbUyBKjjFFTTC6OENkRm6qHVqueREpp5KEv0vyNt
         IudzsHN0V+B4sP0Aa0oZmXH0Dw96d6h1Ju9eIJNPG/92Hz/7gvTd30yE3NOg15jf+15d
         tjlfGrGB7Lyshto6wRmusPElQekIiS9Frvi6jikVVfegk4Yp0bq9ZI+rF8LKSZT5u/Ph
         jevtQfu01ssxnhuw53W/7ZNT7Bx3S17+j5dI0Seez+PayTDGr7rMKxFGphxo+66BlChx
         utZtYaehTAcLHjqfYYY8k1EoG5Nk2wdIDTZFAKC6AFF6oZwVpMCfCIJih3+XTOu0MtdK
         T8Uw==
X-Gm-Message-State: AOJu0Ywch9FGlxnsIWa3TG/zhad94ih9vkUMpvboTG+NNzp+povZ22Va
	1kNN5OJP35F09Of56F5ig5RGGhxMO+e/07WFJmrGBRddJ8yIaCAOybJbZ5tTX8Q=
X-Google-Smtp-Source: AGHT+IHuFbKo3R9th9llB/vFix4fgPYtvz7wIqEANqC/glGaMHydqX7npbogQw0X6jGEWEjb7WB+zA==
X-Received: by 2002:a5d:650f:0:b0:37d:377f:51e6 with SMTP id ffacd0b85a97d-37d3aac1886mr3351790f8f.56.1728554545520;
        Thu, 10 Oct 2024 03:02:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8ba1sm1084168f8f.23.2024.10.10.03.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 03:02:24 -0700 (PDT)
Date: Thu, 10 Oct 2024 13:02:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Erick Archer <erick.archer@outlook.com>
Cc: linux-input@vger.kernel.org
Subject: [bug report] HID: ishtp-hid-client: replace fake-flex arrays with
 flex-array members
Message-ID: <623740cd-613e-47f2-b0cd-a472da979b9b@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Erick Archer,

Commit 63cafaf47a83 ("HID: ishtp-hid-client: replace fake-flex arrays
with flex-array members") from Sep 22, 2024 (linux-next), leads to
the following Smatch static checker warning:

	drivers/hid/intel-ish-hid/ishtp-hid-client.c:306 process_recv()
	warn: potential pointer math issue ('report' is a 64 bit pointer)

drivers/hid/intel-ish-hid/ishtp-hid-client.c
    66 static void process_recv(struct ishtp_cl *hid_ishtp_cl, void *recv_buf,
    67                          size_t data_len)
    68 {
    69         struct hostif_msg *recv_msg;
    70         unsigned char *payload;
    71         struct device_info *dev_info;
    72         int i, j;
    73         size_t        payload_len, total_len, cur_pos, raw_len, msg_len;
    74         int report_type;
    75         struct report_list *reports_list;
    76         struct report *report;
                              ^^^^^^

    77         size_t report_len;
    78         struct ishtp_cl_data *client_data = ishtp_get_client_data(hid_ishtp_cl);
    79         int curr_hid_dev = client_data->cur_hid_dev;
    80         struct ishtp_hid_data *hid_data = NULL;
    81         struct hid_device *hid = NULL;
    82 

[ snip ]

    279 
    280                 case HOSTIF_PUBLISH_INPUT_REPORT_LIST:
    281                         report_type = HID_INPUT_REPORT;
    282                         reports_list = (struct report_list *)payload;
    283                         report = reports_list->reports;
    284 
    285                         for (j = 0; j < reports_list->num_of_reports; j++) {
    286                                 recv_msg = container_of(&report->msg,
    287                                                         struct hostif_msg, hdr);
    288                                 report_len = report->size;
    289                                 payload = recv_msg->payload;
    290                                 payload_len = report_len -
    291                                         sizeof(struct hostif_msg_hdr);
    292 
    293                                 for (i = 0; i < client_data->num_hid_devices;
    294                                      ++i)
    295                                         if (recv_msg->hdr.device_id ==
    296                                         client_data->hid_devices[i].dev_id &&
    297                                         client_data->hid_sensor_hubs[i]) {
    298                                                 hid_input_report(
    299                                                 client_data->hid_sensor_hubs[
    300                                                                         i],
    301                                                 report_type,
    302                                                 payload, payload_len,
    303                                                 0);
    304                                         }
    305 
--> 306                                 report += sizeof(*report) + payload_len;

The pointer math doesn't work here.  This will read way beyond the end of the
buffer.  It needs to be something like:

		report = (void *)report + sizeof(*report) + payload_len;

regards,
dan carpenter

    307                         }
    308                         break;
    309                 default:
    310                         ++client_data->bad_recv_cnt;
    311                         report_bad_packet(hid_ishtp_cl, recv_msg, cur_pos,
    312                                           payload_len);
    313                         ish_hw_reset(ishtp_get_ishtp_device(hid_ishtp_cl));
    314                         break;
    315 
    316                 }
    317 
    318                 msg_len = payload_len + sizeof(struct hostif_msg);

