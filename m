Return-Path: <linux-input+bounces-14136-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3790B2BBF4
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 10:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88DD21BA6175
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 08:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8963278F36;
	Tue, 19 Aug 2025 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="biB2CzXp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBB921E0AF
	for <linux-input@vger.kernel.org>; Tue, 19 Aug 2025 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755592404; cv=none; b=NoXywtMR7rE4e7V6rL10bKFsGO58LjgL7m4KPdVe2xKA/SjiCKf80ELaMFxfY/nE76JrplXLBBfZzO6nvI2Xlw42rcPegG7ffR+dk1yiK+Yjxi8QJ3idn6O3kVM0YQ81AYbhb+vih8pillvFEaMuDBk1JPh8PeBeKnlq1gOvDM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755592404; c=relaxed/simple;
	bh=m4fl+3C78ttB2MLM82T69kvAZeq6wk/HxdlwX4+j3Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mr4bKsuWF9JHokqM5YvGxO/NmT7nI1Jju2KHukb+pf3degs5vdxbTBm6/tEN6ljvTjUTBaEgUUl7cxHS1Omg6m1QB9LspEizc6sWs0gJKZGgB+RBolRh0kzhFKcLuZQnKtkNXHh3MQ1oMERJdrYumjutfIOQTMvhvPn1AntrthI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=biB2CzXp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so26827125e9.2
        for <linux-input@vger.kernel.org>; Tue, 19 Aug 2025 01:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755592401; x=1756197201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQCci+ITB7EYMYx+2EPUa0qFKWepBbz/M8NHn0vItm0=;
        b=biB2CzXpQN3jPMdzZ5Nm69DmMKwB6VHLebqH9RtCrW8r2su6XZDb2GNXYYUD8R9mE1
         KcMapfbWVLwOXvesE9yJopyj3PRgMUKQ41ZRvzf+ds61JTg/kda8PD8Mk4N9gZlHidRN
         pKaPVlFGUYdOFAqU+a1g4zAiGJ/9MOOQ+nBuMQn6oiBfP/Yt9k4dy3XOWlF8Z8csg5ks
         n9CPjLxqJUqtZBUZlsDTBV8U7gaZeji3EjvnNRK3Vu/LwiZUTkYf14xO1BE/4EJAZm+Y
         9ghKqTa29KRHt7Ve4AlJxnDzQuZCEOV8ml+BWNcr1+FHQcCNlzVLqH+AUfEHdhQzJEgs
         L28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755592401; x=1756197201;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQCci+ITB7EYMYx+2EPUa0qFKWepBbz/M8NHn0vItm0=;
        b=Dn53CjbCWTORQlrIVGLhpFiQAycsibvvibIT1uUDW6WflS2Bg6/eMY+VWVXLLY7f6e
         S6t0xtxDBLcTlYaoHQmWcp4nfpIPrKCsoD2EaS9q/hqsHQwxBICQStFaTRMpGDOgI6nF
         v4xpYu59FdMzGSUdrg3sgKvs8aJzI6NwffDB+7TlhQMQ81DZclZ3/vej/ey664Mrygk9
         WKPGtUefEbkBwsrNFyZvxykv3/knSJMHuaC6YEl64Z4qdUqEY868Kkae1AHGdKIQxnoh
         PL1yQLkwtvZUt2HyIDTEHoKkEF8OvmVpaRJnSerW8bjabDhxIFs1wH125pmJWeBv5ouK
         odAA==
X-Gm-Message-State: AOJu0YySxXNmtLU1+csX033A2n318xnEbIzNq3cCpiVlA2SM/nzwXmgr
	Ea7AjSpW+5O9sjh0ap86LLDKOsuBIh/DAQTb1YLpbf2OEXix+Y70PIAq0PPSCTft0dk=
X-Gm-Gg: ASbGncv6BGFoB9xstG0fRGmqNbIjcP4f2ck3FmjEtE9TNvPYbV6JNq6SbtTf2XC5+p0
	FYKwf1MOfIsK49z6wkpKbzHmA3hV5+ibIjdSyKNmyHQo0NlVdsoso8E++USfMJcN/l+FLjTmMzg
	FGTBa2EOgs2aeITlTWk65BI9Ow3OMWz5NvWXNtL0fmaEn8zOZoeCOwXC8rAAMMKklBnSfNntBGt
	eMB1cuczlyyAChECEaAujWlP71bC9d6NoqxbTXuMKah9gaEYmeeGbvtY2vzqSmJtiWRw/5A4z4T
	kW8KE5VD936uytNDDqBOG8TdZgEkVdqNfv00Gef+3zKisZlASn0zI2/EJCFv0e2R/h2xM1P4D67
	+f9BrDLXEZ9KhnMkagKqPRN1SDgI=
X-Google-Smtp-Source: AGHT+IFOoQxAPv0fZe/sGhfYYG3GUrzA4GkaL7QcqQofcOI/b3tm6F0DVu3H7soVRB6Axrcfx2vgTw==
X-Received: by 2002:a05:600c:3584:b0:459:db80:c29f with SMTP id 5b1f17b1804b1-45b46190a3emr118635e9.1.1755592400948;
        Tue, 19 Aug 2025 01:33:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b42a84417sm30407875e9.13.2025.08.19.01.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 01:33:20 -0700 (PDT)
Date: Tue, 19 Aug 2025 11:33:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [bug report] HID: pidff: Add support for AXES_ENABLE field
Message-ID: <aKQ2zYNrk7JRKpOU@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello Tomasz Pakuła,

This is a semi-automatic email about new static checker warnings.

Commit 1d72e7bd340b ("HID: pidff: Add support for AXES_ENABLE field")
from Aug 13, 2025, leads to the following Smatch complaint:

    drivers/hid/usbhid/hid-pidff.c:1308 pidff_find_special_fields()
    error: we previously assumed 'pidff->axes_enable' could be null (see line 1302)

    drivers/hid/usbhid/hid-pidff.c:1322 pidff_find_special_fields()
    warn: variable dereferenced before check 'pidff->axes_enable' (see line 1308)

drivers/hid/usbhid/hid-pidff.c
  1295          if (PIDFF_FIND_SPECIAL_KEYS(operation_id, effect_operation_status,
  1296                                      effect_operation_status) !=
  1297              ARRAY_SIZE(pidff_effect_operation_status)) {
  1298                  hid_err(pidff->hid, "effect operation identifiers not found\n");
  1299                  return -1;
  1300          }
  1301  
  1302          if (!pidff->axes_enable)
                     ^^^^^^^^^^^^^^^^^^
This assumes pidff->axes_enable can be NULL

  1303                  hid_info(pidff->hid, "axes enable field not found!\n");
  1304          else
  1305                  hid_dbg(pidff->hid, "axes enable report count: %u\n",
  1306                          pidff->axes_enable->report_count);
  1307  
  1308          uint found = PIDFF_FIND_GENERAL_DESKTOP(direction_axis_id, axes_enable,
  1309                                                  direction_axis);

But the PIDFF_FIND_GENERAL_DESKTOP() function dereferences it without
checking so if it's NULL then it will crash.

  1310  
  1311          pidff->axis_count = found;
  1312          hid_dbg(pidff->hid, "found direction axes: %u", found);
  1313  
  1314          for (int i = 0; i < sizeof(pidff_direction_axis); i++) {
  1315                  if (!pidff->direction_axis_id[i])
  1316                          continue;
  1317  
  1318                  hid_dbg(pidff->hid, "axis %d, usage: 0x%04x, index: %d", i + 1,
  1319                          pidff_direction_axis[i], pidff->direction_axis_id[i]);
  1320          }
  1321  
  1322          if (pidff->axes_enable && found != pidff->axes_enable->report_count)
                    ^^^^^^^^^^^^^^^^^^
Checked for NULL again.

  1323                  hid_warn(pidff->hid, "axes_enable: %u != direction axes: %u",
  1324                           pidff->axes_enable->report_count, found);

regards,
dan carpenter

