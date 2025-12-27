Return-Path: <linux-input+bounces-16703-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A98CDFD9C
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 15:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5F3A30124DC
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 14:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAB731986C;
	Sat, 27 Dec 2025 14:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DLEx81tS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77F5227E95
	for <linux-input@vger.kernel.org>; Sat, 27 Dec 2025 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766845508; cv=none; b=IY47xudfXKAzXMEKm/PE1HjzX5WT6ycNiDHEGaHf/wwDJ1iqd5yquzLf1mUrs34jOK3PLhtTZ3lMev9oPZbxOevPe9kEO2mhZLsZWYeypcwVyE8xEklkNC2VY5z+r4nOdMTji+OgaOTcGMRQM3hJcqK0mZ3gOZYjbd6Uq2mDNSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766845508; c=relaxed/simple;
	bh=A2NH8q4C7fVPf2dWuZsnLKGtSz5oh/q2W/gIH5638ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N68Pv7ojxSbqH9ITbYe9BzfqCi3Y24yk+9ckiZNb1p+N54VnrhXqv9WeW0q28BVX9y8pzXP3GjyiMIqSjF96GHeOW1ESL2zC9vmHOSMXNpGbabzEE+XD7SuoeR+MH3TZ0EHKJw7UIdX9IzBpIyrjqRo1tQEeC/Z2ezxIEiLGCFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DLEx81tS; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso6482370b3a.2
        for <linux-input@vger.kernel.org>; Sat, 27 Dec 2025 06:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766845506; x=1767450306; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qG0+ohKiSx95lCPoeRkBaenAF/9dUpbZ87AcJoxqhPo=;
        b=DLEx81tSxWtQ7SmK28Q2lr1BXEFKzgihwGi7K6etBrx/PAlP6707La2LXcj60q3ydk
         r68+NZ3hDmn/2aKYrmrP5AyzgWR1L0P9dp7zT4vRRj79FsSxjYEcS/MpOp8VQ8N7IMxQ
         EvjrCLhH5h8og+PSNOVamhQtNfDR+k+pipwRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845506; x=1767450306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG0+ohKiSx95lCPoeRkBaenAF/9dUpbZ87AcJoxqhPo=;
        b=sXrdT7aR049HvoMB7kk/YAVN7Uw0GhrQKX765qG8iaNNxXE7eMWD8wm/y5DNzvYXpI
         gXOKiGAMpny4HakeZibCqM6guR7pfCPGqKQcljOE6+C3/o0YFNIue7kULozuY3viXl3o
         McIfdYnSPA0hIEkykykVpnkyFfxebcbva3Ch1AULk4pIN2vHjSwxaSjSyIjd1TDx3oFw
         pIcfJV/jPftiQeXHoxgSFp/Ftr9Z3fqNoxR1z8KOV1ndSzXbmxHxvjCnnlvOFcvCru0T
         qW4VGBj+J31HWWjdnBTvaOF4u7O8AGKG6SuypAwKEYIMWAMQpyDwpZEoqqj9yOGq6wuV
         i0sA==
X-Forwarded-Encrypted: i=1; AJvYcCVT3x3gG39QMW/KvbGIicbj/rfiunpZ2a1ODy3Xn+R599ndA+Vt7ETPDA9jQvvoCCl7ATPr3xv0tqUHeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7t7h8T6ppYc5ikzjhwKpziQhuU+lPwZnhWj/jmCIDBObMDXka
	WUCRkTCfNRzmzB4wWzB+ccRFhSJaJ3OsX+x30zlj8/e0cSFZVcKaULqUtjVAxMqxqpUjipNs3T8
	Qcw4M6Lwwbj/CWf+IDM0GIb3G1VPCezGuRW03LGQt
X-Gm-Gg: AY/fxX6SL1N07R4C9s7+LCv9VYe6oZPXr5OgqA+rAC+ojo1f/2EL71dU3xUWAgcPKcl
	0+dq60cOwkeXuiD4fgFwelaGpx/dDkCsAFmA1z1BafgGxeokljqgaX91eUxNQkjjdJGuMkk+iXE
	jVMo88Ox1PuCGSHXu6IZ1sEzLcCBx1vK3aQirdRzTqqJKYMERTy8H4RdOhvxvmdQKCN53zVOD/Z
	bpb4vkAEOzO25ljHTyTJZy4DKDVF5wD9CS8iPHVvtmgPz5LhaPrDfrT7fQ/5N4mi8y0df3ViH1B
	eowo
X-Google-Smtp-Source: AGHT+IHnEGOmXdjfQsetVVbNG8ehT65yiF1nHmPBkUVYero3HJqeWEGu77h5h3mI6v4oKE3+iSLjngfGXjPOlcDmCo4=
X-Received: by 2002:a05:6a20:72a5:b0:34f:68e9:da94 with SMTP id
 adf61e73a8af0-376a81dcc8fmr24774064637.30.1766845505998; Sat, 27 Dec 2025
 06:25:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224152238.485415-1-fabiobaltieri@chromium.org> <20251224152238.485415-2-fabiobaltieri@chromium.org>
In-Reply-To: <20251224152238.485415-2-fabiobaltieri@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 27 Dec 2025 07:24:33 -0700
X-Gm-Features: AQt7F2pu5irmQrlelsCWH9CO1JsXgyJlMuIRF8sLAfYATcFturh6KCklaDBGaMQ
Message-ID: <CAFLszThHmN-eGMwwgUhSFbWcbuOYYs-eFh6d6ZVTXekRGv6Hdg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Input: cros_ec_keyb - add function key support
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Fabio,

On Wed, 24 Dec 2025 at 08:22, Fabio Baltieri <fabiobaltieri@chromium.org> wrote:
>
> Add support for handling an Fn button and sending separate keycodes for
> a subset of keys in the matrix defined in the upper half of the keymap.
>
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  drivers/input/keyboard/cros_ec_keyb.c | 120 ++++++++++++++++++++++----
>  1 file changed, 104 insertions(+), 16 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>

I suggest a function comment for the two new functions you add.

> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index 1c6b0461dc35..8b95b4f8a37d 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -29,6 +29,11 @@
>
>  #include <linux/unaligned.h>
>
> +/* Maximum size of the normal key matrix, this is limited by the host command
> + * key_matrix field defined in ec_response_get_next_data_v3
> + */
> +#define CROS_EC_KEYBOARD_COLS_MAX 18
> +
>  /**
>   * struct cros_ec_keyb - Structure representing EC keyboard device
>   *
> @@ -44,6 +49,11 @@
>   * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
>   * @notifier: interrupt event notifier for transport devices
>   * @vdata: vivaldi function row data
> + * @use_fn_overlay: whether the driver use an fn function overlay
> + * @normal_key_status: active normal keys map
> + * @fn_key_status: active function keys map
> + * @fn_key_pressed: tracks the function key status
> + * @fn_key_triggered: tracks where any function key fired
>   */
>  struct cros_ec_keyb {
>         unsigned int rows;
> @@ -61,6 +71,12 @@ struct cros_ec_keyb {
>         struct notifier_block notifier;
>
>         struct vivaldi_data vdata;
> +
> +       bool use_fn_overlay;
> +       u8 normal_key_status[CROS_EC_KEYBOARD_COLS_MAX];
> +       u8 fn_key_status[CROS_EC_KEYBOARD_COLS_MAX];
> +       bool fn_key_pressed;
> +       bool fn_key_triggered;
>  };
>
>  /**
> @@ -166,16 +182,83 @@ static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
>         return false;
>  }
>
> +static void cros_ec_keyb_process_fn_key(struct cros_ec_keyb *ckdev,
> +                                       int row, int col, bool state)
> +{
> +       struct input_dev *idev = ckdev->idev;
> +       int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
> +
> +       ckdev->fn_key_pressed = state;
> +
> +       if (state) {
> +               ckdev->fn_key_triggered = false;
> +       } else if (!ckdev->fn_key_triggered) {
> +               /*
> +                * Send the original code if nothing else has been pressed
> +                * together with Fn.
> +                */
> +               input_event(idev, EV_MSC, MSC_SCAN, pos);
> +               input_report_key(idev, KEY_FN, true);
> +               input_sync(idev);
> +
> +               input_event(idev, EV_MSC, MSC_SCAN, pos);
> +               input_report_key(idev, KEY_FN, false);
> +       }
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
> +       if (ckdev->use_fn_overlay) {
> +               if (code == KEY_FN)
> +                       return cros_ec_keyb_process_fn_key(ckdev, row, col, state);
> +
> +               if (!state) {
> +                       if (ckdev->fn_key_status[col] & BIT(row)) {
> +                               pos = MATRIX_SCAN_CODE(row + ckdev->rows, col, ckdev->row_shift);
> +                               code = keycodes[pos];

You might want a helper to do this as it is repeated below

> +
> +                               ckdev->fn_key_status[col] &= ~BIT(row);
> +                       } else if (ckdev->normal_key_status[col] & BIT(row)) {
> +                               ckdev->normal_key_status[col] &= ~BIT(row);
> +                       } else {
> +                               /* Discard, key press code was not sent */
> +                               return;
> +                       }
> +               } else if (ckdev->fn_key_pressed) {
> +                       pos = MATRIX_SCAN_CODE(row + ckdev->rows, col, ckdev->row_shift);
> +                       code = keycodes[pos];
> +
> +                       ckdev->fn_key_triggered = true;
> +
> +                       if (!code)
> +                               return;
> +
> +                       ckdev->fn_key_status[col] |= BIT(row);
> +               } else {
> +                       ckdev->normal_key_status[col] |= BIT(row);
> +               }
> +       }
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
> @@ -192,20 +275,13 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
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
> -
> -                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> -                               input_report_key(idev, keycodes[pos],
> -                                                new_state);
> -                       }
> +
> +                       if (new_state == old_state)
> +                               continue;
> +
> +                       cros_ec_keyb_process_one(ckdev, row, col, new_state);
>                 }
>                 ckdev->old_kb_state[col] = kb_state[col];
>         }
> @@ -597,12 +673,19 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
>         struct device *dev = ckdev->dev;
>         struct input_dev *idev;
>         const char *phys;
> +       unsigned int rows_keymap;
>         int err;
>
>         err = matrix_keypad_parse_properties(dev, &ckdev->rows, &ckdev->cols);
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
> @@ -635,7 +718,12 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
>         ckdev->ghost_filter = device_property_read_bool(dev,
>                                         "google,needs-ghost-filter");
>
> -       err = matrix_keypad_build_keymap(NULL, NULL, ckdev->rows, ckdev->cols,
> +       ckdev->use_fn_overlay = device_property_read_bool(dev,
> +                                       "google,use-fn-overlay");
> +
> +       rows_keymap = ckdev->use_fn_overlay ? ckdev->rows * 2 : ckdev->rows;
> +
> +       err = matrix_keypad_build_keymap(NULL, NULL, rows_keymap, ckdev->cols,
>                                          NULL, idev);
>         if (err) {
>                 dev_err(dev, "cannot build key matrix\n");
> --
> 2.52.0.351.gbe84eed79e-goog
>

Regards,
Simon

