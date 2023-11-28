Return-Path: <linux-input+bounces-280-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1E57FB498
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 09:45:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB9771C20F53
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 08:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156A14C9E;
	Tue, 28 Nov 2023 08:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PVg+vAbG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B4A198
	for <linux-input@vger.kernel.org>; Tue, 28 Nov 2023 00:45:06 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cfcc9b3b5cso17368515ad.0
        for <linux-input@vger.kernel.org>; Tue, 28 Nov 2023 00:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701161106; x=1701765906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHxxwveZDRAPnfOWumxXktb5k7NbUjKgtDpJO55ZaA8=;
        b=PVg+vAbG5Eli/fKzjnqSzq3QEwBSoaN9bOYtemv4oCkYgNDbXV7U2P5Sz7GwuxRSwY
         cAWt8nh6n4Jqufzl4cYLtzzmNGOkzTHSGqJkWIWElJlOwJPUV59MYPgi9Qy0+oqrYyZb
         EBV/JQsIk7XOGsrA7Mavoiqn8zqa1sW9x2hnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701161106; x=1701765906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHxxwveZDRAPnfOWumxXktb5k7NbUjKgtDpJO55ZaA8=;
        b=eaOr6FbtrKryhLXETJeyqxrhTlh0FNxRjQCMLb/wROQ45a6CloupIbnXGoKRql4Pi5
         7uVPGtolYfvrJQzEKlNbxg6BbZmxQeYNAgU6xtyMu4PSrJfkjWHpywq3j+KZlaAyk2TZ
         pjNR9Vj374mG1rM4pYCr7htj4zWlX75t/gsjy/owrQH1LdhPot8TvA6PB0S7YvuEBK5d
         2TTfVVoW2ayqRUe27xWYP2zEJ6wds+W+JR5vmZ7eyRFTYseGAViS/8Bb45DTGEoR9Iek
         djaRWswgrtBpjatF7LUqQwu2WA2JVU500KkrRgMW6aFyBSsXpKRFtXTf9WUsjSJ6ohHR
         T0Pw==
X-Gm-Message-State: AOJu0Yzwon2hWJGlKhKSFAFo8byq/rKyWkaxgDsV4m5grv47x+SYJ1jl
	QPPUHJOKhDD3mg5NMd9RYOUu+Q==
X-Google-Smtp-Source: AGHT+IFwNRanqg6iNjPiAn8C7xAInJUbYOtL1AJjn6XOh76hm70XQlF/qqZTYAqMlV2R/DvAZERpiQ==
X-Received: by 2002:a17:902:d2c1:b0:1cf:ccc3:c9d7 with SMTP id n1-20020a170902d2c100b001cfccc3c9d7mr7924520plc.3.1701161106024;
        Tue, 28 Nov 2023 00:45:06 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:a990:1e95:a915:9c70])
        by smtp.gmail.com with ESMTPSA id j1-20020a170902c08100b001ab39cd875csm8358074pld.133.2023.11.28.00.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 00:45:05 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	andriy.shevchenko@linux.intel.com,
	Jiri Kosina <jikos@kernel.org>,
	linus.walleij@linaro.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	james.clark@arm.com,
	james@equiv.tech,
	keescook@chromium.org,
	rafael@kernel.org,
	tglx@linutronix.de,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [RFC PATCH v3 1/5] of: dynamic: Add of_changeset_update_prop_string
Date: Tue, 28 Nov 2023 16:42:30 +0800
Message-ID: <20231128084236.157152-2-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231128084236.157152-1-wenst@chromium.org>
References: <20231128084236.157152-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper function to add string property updates to an OF changeset.
This is similar to of_changeset_add_prop_string(), but instead of adding
the property (and failing if it exists), it will update the property.

This shall be used later in the DT hardware prober.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
New patch added in v3.
---
 drivers/of/dynamic.c | 47 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h   |  3 +++
 2 files changed, 50 insertions(+)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index f63250c650ca..d22aad938667 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -1039,3 +1039,50 @@ int of_changeset_add_prop_u32_array(struct of_changeset *ocs,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(of_changeset_add_prop_u32_array);
+
+static int of_changeset_update_prop_helper(struct of_changeset *ocs,
+					   struct device_node *np,
+					   const struct property *pp)
+{
+	struct property *new_pp;
+	int ret;
+
+	new_pp = __of_prop_dup(pp, GFP_KERNEL);
+	if (!new_pp)
+		return -ENOMEM;
+
+	ret = of_changeset_update_property(ocs, np, new_pp);
+	if (ret) {
+		kfree(new_pp->name);
+		kfree(new_pp->value);
+		kfree(new_pp);
+	}
+
+	return ret;
+}
+
+/**
+ * of_changeset_update_prop_string - Add a string property update to a changeset
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @prop_name:	name of the property to be updated
+ * @str:	pointer to null terminated string
+ *
+ * Create a string property to be updated and add it to a changeset.
+ *
+ * Return: 0 on success, a negative error value in case of an error.
+ */
+int of_changeset_update_prop_string(struct of_changeset *ocs,
+				    struct device_node *np,
+				    const char *prop_name, const char *str)
+{
+	struct property prop;
+
+	prop.name = (char *)prop_name;
+	prop.length = strlen(str) + 1;
+	prop.value = (void *)str;
+
+	return of_changeset_update_prop_helper(ocs, np, &prop);
+}
+EXPORT_SYMBOL_GPL(of_changeset_update_prop_string);
diff --git a/include/linux/of.h b/include/linux/of.h
index 6a9ddf20e79a..c69bc7da380e 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1601,6 +1601,9 @@ static inline int of_changeset_add_prop_u32(struct of_changeset *ocs,
 {
 	return of_changeset_add_prop_u32_array(ocs, np, prop_name, &val, 1);
 }
+int of_changeset_update_prop_string(struct of_changeset *ocs,
+				    struct device_node *np,
+				    const char *prop_name, const char *str);
 
 #else /* CONFIG_OF_DYNAMIC */
 static inline int of_reconfig_notifier_register(struct notifier_block *nb)
-- 
2.43.0.rc1.413.gea7ed67945-goog


