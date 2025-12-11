Return-Path: <linux-input+bounces-16538-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C29CB6059
	for <lists+linux-input@lfdr.de>; Thu, 11 Dec 2025 14:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E9B3301373F
	for <lists+linux-input@lfdr.de>; Thu, 11 Dec 2025 13:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70642313294;
	Thu, 11 Dec 2025 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="csHQqq6T"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13802FC881
	for <linux-input@vger.kernel.org>; Thu, 11 Dec 2025 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765459759; cv=none; b=nIAvjFUXgvrjCWqI8Rgz+cYLvFjEwKsStSuF22yzZ0RWiSt87T8o6B2VB4UWqqBoOBXL9RkkBqBQtPa6ayi3JEA8yxHLbQgA3LNv3xw6/WSlrtEwOiLOsrtIXzVT5Qr/NWq0W3lI0GWyjZryD4f0Na6Nk2ckrHpE/UITTN90G9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765459759; c=relaxed/simple;
	bh=GC52vdlrMOCjvAl4e8rzaU0FUykCrlzn0zAFAvejcPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sEM+sKDVAq5KF2BQYJp8ATB1ONoV+vVtuxaLMvb6p0L8nq+EV57h3H9w/kW1tavYFbpdx/e81IUaHaTd6eU86MQLJnbUIBOMcijhSPntqzo8+WrSnhQsd1gUrqlnJUTy8OPeKKa1ZskuyTilsgAIqEO7xGzd4t/sdOMIMBPBaLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=csHQqq6T; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-644f90587e5so170188a12.0
        for <linux-input@vger.kernel.org>; Thu, 11 Dec 2025 05:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765459755; x=1766064555; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iZd9JSxTLfqAEQ8kerPa/TuPf6DF4xFDdQfs8AMcfNc=;
        b=csHQqq6TLEKCMZy8oRJsVZhd/VEoAC0+Aq4ioHyQTcy1qXfCZdalnvVNxMMGImm0PL
         6p5rXaEoYAIKduj/48gBTGHyb8pccb5mjBjemCqR3cQRT84RRPt04v+saJ/aLmCCKVrm
         DSoAad8U7fPzQ0WjfWloYtSJ0CQViQfMiPLRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765459755; x=1766064555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZd9JSxTLfqAEQ8kerPa/TuPf6DF4xFDdQfs8AMcfNc=;
        b=Y7jT8TxwZdZJUz8g+ix9/kdGJME3XCiQf/8IoGX1odVU/i53AOWs4+EEuMJLqFU/Lk
         RTZ5tjVrFIBipqcrciUbxnT+LZF5HHYa5KfOLlbgukhozdIpCRBl2aDN4lwiBMoLrnn6
         M5XIO7sPeFKL/3wJTUK+h+9nKJ0lMVL0z8qbcnxbdheEKnVoCy3HfHvrjHvJvbH/HetA
         wfA1zMYoe5inP6Q9tvlfq5vq9sA/nhnDHph71QZQ3R9jLjo2ySeRyK6LwsEP2wfuaYwz
         KrHha5DMuR6CKxHkPvzBtO56I4m96oRMkLaQobeu6kb4KRnVqKurBe028m59WwrjOYYf
         XDxg==
X-Forwarded-Encrypted: i=1; AJvYcCWlqmcY/CelAW2cM0v3PRKJEzbPrfvLoarlpVDSwzmGuWMX2TQpXB+cnAMs2ajsl3snFeSf/HwyW7VqrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsPWlnxeWmxqdNRA3I3AgI9Oyle3XOz5E3yyeq8JkqT2z4yNbs
	PKHrXL8jh6JyGbyQvzEyqVW9KTPtBO1ZcCOqYJoqhGbsXmuEI0tYyRaIbU8JFG6RMxBYZCEcahE
	usVC517/3XgbAkMCxa/hZaVz3guSGKcL0RoUTjCKH
X-Gm-Gg: AY/fxX6BQEOyHip8qIKvCORSVYzC7T/wUWsk+RivKB8b1tQycLXHVU/gYIOa+UTd7fn
	W7dMcUj2mISxkuWpug/qqcN0rQdrpGBl1k15UBbPJVKsZ3pKCFwTxgD0eWdQUNWSM3l4Dq0b8sA
	nkY1HCsgp6nP6uQtx50Aa5HGwUtqNebcdSnu2kgXQ3xRjnkHAlvm0BWUEV18lTUxYWby+fIsbqv
	FY4xKv6QZhDzPNQAkd1KB37AbdDTZEgkj9nmHis+lsp5p/SVsJquMhrQ6SETJv/2MYm6Ax/TiDn
	Fqev
X-Google-Smtp-Source: AGHT+IEuv3tebhZIRlzQWAPBE+dSHTINZTdfGtZ3PA3haPFLoHb5OV390vNmFdrv9z8I1+SlzrtdMYHkubaZaYo7/sU=
X-Received: by 2002:a05:6402:3508:b0:641:1d64:8dce with SMTP id
 4fb4d7f45d1cf-6496cbc4315mr5231506a12.17.1765459754896; Thu, 11 Dec 2025
 05:29:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209154706.529784-1-fabiobaltieri@chromium.org> <20251209154706.529784-3-fabiobaltieri@chromium.org>
In-Reply-To: <20251209154706.529784-3-fabiobaltieri@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 11 Dec 2025 06:29:01 -0700
X-Gm-Features: AQt7F2qBWeYaN0u_VBKcb-i_m0I-6rgQQIPctWT0S1pBtt7pqVSJ69wvkHmUQvk
Message-ID: <CAFLszThUU4hfb4vY4mmGHQadRKThG3e=9cAKRy_ampKwA_XNcA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] Input: cros_ec_keyb: add function key support
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.orga
Content-Type: text/plain; charset="UTF-8"

Hi Fabio!

On Tue, 9 Dec 2025 at 08:47, Fabio Baltieri <fabiobaltieri@chromium.org> wrote:
>
> Add support for handling an Fn button and sending separate keycodes for
> a subset of keys in the matrix.
>
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  drivers/input/keyboard/cros_ec_keyb.c | 190 ++++++++++++++++++++++++--
>  1 file changed, 176 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index 2822c592880b..b0965e5d20de 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -29,6 +29,14 @@
>
>  #include <linux/unaligned.h>
>
> +/* Maximum number of Fn keys, limited by the key status mask size. */
> +#define CROS_EC_FN_KEYMAP_MAX 32
> +
> +/* Maximum size of the normal key matrix, this is limited by the host command
> + * key_matrix field defined in ec_response_get_next_data_v3
> + */
> +#define CROS_EC_KEYBOARD_COLS_MAX 18
> +
>  /**
>   * struct cros_ec_keyb - Structure representing EC keyboard device
>   *
> @@ -44,6 +52,13 @@
>   * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
>   * @notifier: interrupt event notifier for transport devices
>   * @vdata: vivaldi function row data
> + * @fn_key: coordinate of the function key
> + * @fn_keymap: array of coordinate and codes for the function keys
> + * @fn_keymap_len: number of entries in the fn_keymap array
> + * @fn_key_status: active function keys bitmap
> + * @normal_key_status: active normal keys bitmap
> + * @fn_key_pressed: tracks the function key status
> + * @fn_key_triggered: tracks where any function key fired
>   */
>  struct cros_ec_keyb {
>         unsigned int rows;
> @@ -61,6 +76,14 @@ struct cros_ec_keyb {
>         struct notifier_block notifier;
>
>         struct vivaldi_data vdata;
> +
> +       uint32_t fn_key;

Normally we use u32/u8 these days

> +       uint32_t *fn_keymap;
> +       int fn_keymap_len;
> +       uint32_t fn_key_status;
> +       uint8_t normal_key_status[CROS_EC_KEYBOARD_COLS_MAX];
> +       bool fn_key_pressed;
> +       bool fn_key_triggered;
>  };
>
>  /**
> @@ -166,16 +189,108 @@ static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
>         return false;
>  }
>
> +static bool cros_ec_key_is(int row, int col, uint32_t key)
> +{
> +       if (row == KEY_ROW(key) && col == KEY_COL(key))
> +               return true;
> +
> +       return false;
> +}
> +
> +static void cros_ec_keyb_process_one(struct cros_ec_keyb *ckdev,
> +                                    int row, int col, bool state)
> +{
> +       struct input_dev *idev = ckdev->idev;
> +       const unsigned short *keycodes = idev->keycode;
> +       int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
> +       unsigned int code = keycodes[pos];
> +
> +       dev_dbg(ckdev->dev, "changed: [r%d c%d]: byte %02x\n", row, col, state);
> +
> +       if (ckdev->fn_keymap) {
> +               if (cros_ec_key_is(row, col, ckdev->fn_key)) {
> +                       ckdev->fn_key_pressed = state;
> +
> +                       if (state) {
> +                               ckdev->fn_key_triggered = false;
> +                       } else if (!ckdev->fn_key_triggered) {
> +                               /*
> +                                * Send the original code if nothing else has
> +                                * been pressed together with Fn.
> +                                */
> +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> +                               input_report_key(idev, code, true);
> +                               input_sync(ckdev->idev);

What is this function? I might be missing a patch?

> +
> +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> +                               input_report_key(idev, code, false);
> +                       }
> +
> +                       return;
> +               }
> +
> +               if (!state) {
> +                       /* Key release, may need to release the Fn code */
> +                       for (int i = 0; i < ckdev->fn_keymap_len; i++) {
> +                               if (!cros_ec_key_is(row, col,
> +                                                   ckdev->fn_keymap[i]))
> +                                       continue;
> +
> +                               if ((ckdev->fn_key_status & BIT(i)) == 0)
> +                                       continue;
> +
> +                               code = KEY_VAL(ckdev->fn_keymap[i]);
> +                               ckdev->fn_key_status &= ~BIT(i);
> +
> +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> +                               input_report_key(idev, code, state);
> +
> +                               return;
> +                       }
> +
> +                       if ((ckdev->normal_key_status[col] & BIT(row)) == 0)
> +                               /* Discard, key press code was not sent */
> +                               return;
> +               } else if (ckdev->fn_key_pressed) {
> +                       /* Key press while holding Fn */
> +                       ckdev->fn_key_triggered = true;
> +
> +                       for (int i = 0; i < ckdev->fn_keymap_len; i++) {
> +                               if (!cros_ec_key_is(row, col,
> +                                                   ckdev->fn_keymap[i]))
> +                                       continue;
> +
> +                               code = KEY_VAL(ckdev->fn_keymap[i]);
> +                               ckdev->fn_key_status |= BIT(i);
> +
> +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> +                               input_report_key(idev, code, state);
> +
> +                               return;
> +                       }
> +
> +                       /* Do not emit a code if the key is not mapped */
> +                       return;
> +               }
> +       }

I think this function could do with splitting a bit

> +
> +       if (state)
> +               ckdev->normal_key_status[col] |= BIT(row);
> +       else
> +               ckdev->normal_key_status[col] &= ~BIT(row);
> +
> +       input_event(idev, EV_MSC, MSC_SCAN, pos);
> +       input_report_key(idev, code, state);
> +}
>
>  /*
>   * Compares the new keyboard state to the old one and produces key
> - * press/release events accordingly.  The keyboard state is 13 bytes (one byte
> - * per column)
> + * press/release events accordingly.  The keyboard state is one byte
> + * per column.
>   */
>  static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
>                          uint8_t *kb_state, int len)
>  {
> -       struct input_dev *idev = ckdev->idev;
>         int col, row;
>         int new_state;
>         int old_state;
> @@ -192,20 +307,13 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
>
>         for (col = 0; col < ckdev->cols; col++) {
>                 for (row = 0; row < ckdev->rows; row++) {
> -                       int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
> -                       const unsigned short *keycodes = idev->keycode;
> -
>                         new_state = kb_state[col] & (1 << row);
>                         old_state = ckdev->old_kb_state[col] & (1 << row);
> -                       if (new_state != old_state) {
> -                               dev_dbg(ckdev->dev,
> -                                       "changed: [r%d c%d]: byte %02x\n",
> -                                       row, col, new_state);
>
> -                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> -                               input_report_key(idev, keycodes[pos],
> -                                                new_state);
> -                       }
> +                       if (new_state == old_state)
> +                               continue;
> +
> +                       cros_ec_keyb_process_one(ckdev, row, col, new_state);
>                 }
>                 ckdev->old_kb_state[col] = kb_state[col];
>         }
> @@ -604,6 +712,12 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
>         if (err)
>                 return err;
>
> +       if (ckdev->cols > CROS_EC_KEYBOARD_COLS_MAX) {
> +               dev_err(dev, "keypad,num-columns too large: %d (max: %d)\n",
> +                       ckdev->cols, CROS_EC_KEYBOARD_COLS_MAX);
> +               return -EINVAL;
> +       }
> +
>         ckdev->valid_keys = devm_kzalloc(dev, ckdev->cols, GFP_KERNEL);
>         if (!ckdev->valid_keys)
>                 return -ENOMEM;
> @@ -660,6 +774,47 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
>         return 0;
>  }
>
> +static int cros_ec_keyb_register_fn_keys(struct cros_ec_keyb *ckdev)
> +{
> +       struct device *dev = ckdev->dev;
> +       uint32_t fn_key;
> +       uint32_t *keymap;
> +       int keymap_len;
> +       int ret;
> +
> +       if (!(device_property_present(dev, "fn-key") &&
> +             device_property_present(dev, "fn-keymap")))
> +               return 0;
> +
> +       device_property_read_u32(dev, "fn-key", &fn_key);
> +
> +       keymap_len = device_property_count_u32(ckdev->dev, "fn-keymap");
> +       if (keymap_len > CROS_EC_FN_KEYMAP_MAX) {
> +               dev_err(dev, "fn-keymap too large: %d limit=%d",
> +                       keymap_len, CROS_EC_FN_KEYMAP_MAX);
> +               return -EINVAL;
> +       }
> +
> +       keymap = devm_kcalloc(dev, keymap_len, sizeof(*keymap), GFP_KERNEL);
> +       if (!keymap)
> +               return -ENOMEM;
> +
> +       ret = device_property_read_u32_array(dev, "fn-keymap", keymap, keymap_len);
> +       if (ret) {
> +               dev_err(dev, "failed to read fn-keymap property: %d\n", ret);
> +               return ret;
> +       }
> +
> +       for (int i = 0; i < keymap_len; i++)
> +               __set_bit(KEY_VAL(keymap[i]), ckdev->idev->keybit);
> +
> +       ckdev->fn_key = fn_key;
> +       ckdev->fn_keymap = keymap;
> +       ckdev->fn_keymap_len = keymap_len;
> +
> +       return 0;
> +}
> +
>  static ssize_t function_row_physmap_show(struct device *dev,
>                                          struct device_attribute *attr,
>                                          char *buf)
> @@ -734,6 +889,13 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
>                                 err);
>                         return err;
>                 }
> +
> +               err = cros_ec_keyb_register_fn_keys(ckdev);
> +               if (err) {
> +                       dev_err(dev, "cannot register fn-keys inputs: %d\n",
> +                               err);
> +                       return err;
> +               }
>         }
>
>         err = cros_ec_keyb_register_bs(ckdev, buttons_switches_only);
> --
> 2.52.0.223.gf5cc29aaa4-goog
>

Can the sandbox driver support this too?

Regards,
Simon

