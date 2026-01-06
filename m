Return-Path: <linux-input+bounces-16792-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E59CF80DC
	for <lists+linux-input@lfdr.de>; Tue, 06 Jan 2026 12:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22E9F30402CC
	for <lists+linux-input@lfdr.de>; Tue,  6 Jan 2026 11:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E9B326958;
	Tue,  6 Jan 2026 11:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="miyM0IqL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F829309EE5
	for <linux-input@vger.kernel.org>; Tue,  6 Jan 2026 11:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767698999; cv=none; b=EI5NH9a6sqUyoM3SJFSorQbYuCy2V1kFHxkY2RuFMVYFG3frGi/DYBQuuIs+n5ubnlBuZB5kBEbmm3gD8r50McNQZuZS8MGXSVinOrAqODzvGR8mzFpQamUfMlSDc/ZQ5qg/tmBLg/vrsELj8Aoyun7lV/LAUuoUqWkyd0Y6zFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767698999; c=relaxed/simple;
	bh=0wrkhC+xD7/mOrBL5I7lsFF7eZ11fQ2+WNqMAWhtW1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ny9QC1dEV4DFE92ZKQXzFW14HBnqqUMKmNVxM7+LgyKMDQGDvwH6cTTzNrg+mOzOErgZapd5iOwQxwW/6eKdZ1EDqKZ9Y+mVfjgjLEeDepO4wTA3cxtwuppkygDC7mrqmdNr/Zw03geNsnoBQvRjiVpLz2aTVaFedIqT22o+ToE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=miyM0IqL; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so446063f8f.0
        for <linux-input@vger.kernel.org>; Tue, 06 Jan 2026 03:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767698996; x=1768303796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HCbInK7KTXrm5vdne7L3ipVyi5YmT0872ER+KijF8Q8=;
        b=miyM0IqLxe6BtG1RfO/TCvK8uT1HpjsTCjTAIHo7mW9UAtIJWKKOUQno5jn7ynNbe5
         p4EUDPcpHZtDAnZ8wKT8q0KdHUVmQd0HsiYjvvX7Dz9LR8iv3WiHjW1lhRzsOQzUeJ1p
         wKg+9+s+pX0FkkXFht/FEnXRKvQzIZT9YTjvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767698996; x=1768303796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCbInK7KTXrm5vdne7L3ipVyi5YmT0872ER+KijF8Q8=;
        b=GQr3UpRbi1nZGh3pZCVU9OGL+ZrDQmjZLpFWY4l9aUR46YuXo1KPEwyajMfGqAadeB
         7YW55jUqlLTfEnSfJUx++yaAMEZHs4amvSNmx06sy5uXbERrhLIJSs8RbTKlT35iwAeV
         4BZKazSH7d1avmMEEPLkR8DSn4x0mj9xg4v6AoaBpyvnx+4zA7iMy053OMWcy4C7jk0K
         wTuk8suyrQ+tDDfTjw4A1RRsql0r3vh9k7cxtMKmCYsBQIiH67Z/+jJJLrwNSAhRbkXH
         nftgFCiOm6Kk457f9BMpodX4izVp0jY4o/YITnS4WW0Boc2s8ys7X+BD/8zqW44B3v/x
         m9ig==
X-Forwarded-Encrypted: i=1; AJvYcCXwdyK0Fllps7b3l1Ga2t2ZmmmIerBjHmlx/LulVR5Yw2T+NWviqsg2IZZfNQJUOWIjV5PTFhM+wow3VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXAu/PqyIiOsmZDH35qqNwFmfwNO78Pd5FGBu1IIqkp4nqTyCW
	6AWcFl9OevJ0vG6c6+JUhaVhKpz4MxU2rFxpols+8mp6eQj7Q1f2nupDqjngJh1uFg==
X-Gm-Gg: AY/fxX515x0DB86gkK1zY7FrZRsBzUsfTwUyk7cpt7mykQkUGnsBcA9vT6BO0DIfje8
	GwIMEAJB6epIfSRg0XWS+Y9D6K/b1dcAAxwQufD/BfVxZUtyRzQCS8/1EAsnJxmLumVjT0Xoz4y
	/is6o5FKUNPlNoA4BqfElq00fRhmC68baaWMaxRh+ZSN2tWT+IgGS8RfIU1TyMjuMywwWuGJULw
	IDu2uWxju03DqCNLu+a2KmpEQLl3eDtpx9hGlqg6QfQmruEs7fdweKpcLq0VgzCusLTF4F+QtCJ
	Dqrxpft6WhHYk0cBRenvBWplvIXVK8TAer8i4NZvHLU2Lxf/73phTuw8XvFdPNaaEDPL9pNbO/6
	gQYUEYa+9psMWv3xovVPQ5xNnlq5vdTQZ/KUqmxETOglfvJLr5tHSLFZFrl0hDDpmKTSR8nljBD
	tqZD4dpWCJ1FLIJ2UHFswQ3CAe9w==
X-Google-Smtp-Source: AGHT+IGfT/FLcYXvnITELsfpKQwLNSv0AztBCwz7BXKs052Z23SiSlEo4WIlvNjFk/SeXeZ9VYOr/Q==
X-Received: by 2002:a05:6000:2387:b0:42b:5592:ebe6 with SMTP id ffacd0b85a97d-432bc97f368mr3199898f8f.0.1767698995863;
        Tue, 06 Jan 2026 03:29:55 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm3757482f8f.31.2026.01.06.03.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 03:29:55 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/1] Input: cros_ec_keyb: add function key support
Date: Tue,  6 Jan 2026 11:29:52 +0000
Message-ID: <20260106112953.692304-1-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, v4 of the cros-ec-keyb fn key support, reworked the logic to detect
the fn layer automatically, removed the dedicated dt property.

Changes from v3:
  - implemented fn layer runtime detection
  - tweaked cros_ec_keyb_fn_code to return back the correct position
    code

Changes from v2:
  - renamed the dt property to use-fn-map, dropped the example
  - added few function comments
  - added a helper for obtaining the fn code
  - reordered, dt patch first

Changes from v1:
  - change struct to short types
  - refactored the fn key handling in its own function
  - changed props to use the google, prefix
  - reworked the properties to use an overlay map rather than a
    dedicated one


Fabio Baltieri (1):
  Input: cros_ec_keyb - add function key support

 drivers/input/keyboard/cros_ec_keyb.c | 174 +++++++++++++++++++++++---
 1 file changed, 158 insertions(+), 16 deletions(-)

-- 
2.52.0.351.gbe84eed79e-goog


